local function less_lint_quickfix()
  local file_ext = vim.fn.expand('%:e')
  local file_path = vim.fn.expand('%:p')

  if file_ext:lower() ~= 'less' then
    print("Not a LESS file (current file extension is '" .. file_ext .. "').")
    return
  end

  local lessc_check = vim.fn.system('command -v lessc'):gsub('\n', '')
  if lessc_check == '' then
    print("Error: 'lessc' command not found. Please install LESS (e.g., npm install -g less).")
    return
  end

  local linter_command = 'lessc --lint ' .. vim.fn.shellescape(file_path) .. ' 2>&1'
  local output_lines = vim.fn.systemlist(linter_command)

  local qf_list = {}
  local found_errors = false

  -- Regex to parse lessc --lint output.
  -- Example output: "path/to/file.less:1:4: expected '}'" or "path/to/file.less:1: Property 'foo' is undefined."
  -- Group 1: path/to/file.less:1: (filename and line, always present)
  -- Group 2: 4: (column, optional)
  -- Group 3: expected '}' (message)
  local regex = [[^([^:]+:\d+:)(\d+:)?(.*)$]]

  for _, line in ipairs(output_lines) do
    local file_lnum_part, col_part, message_part = line:match(regex)
    if file_lnum_part then
      local filename, lnum_str = file_lnum_part:match("^(.-):(%d+):$")
      local lnum = tonumber(lnum_str)

      local col = 0
      if col_part then
        col = tonumber(col_part:match("^(%d+):$")) or 0
      end

      local message = message_part:match("^%s*(.-)%s*$") -- Trim whitespace

      table.insert(qf_list, {
        filename = filename,
        lnum = lnum,
        col = col,
        text = message,
        type = 'E' -- Error type
      })
      found_errors = true
    end
  end

  if not found_errors then
    print("No LESS linting errors found.")
    -- Clear any previous quickfix list and close the window
    vim.fn.setqflist({}, 'r')
    vim.cmd('pclose')
  else
    -- Populate the quickfix list and open the window
    vim.fn.setqflist(qf_list, 'r')
    vim.cmd('copen')
  end
end

-- Define a custom command to easily run the linter
vim.api.nvim_create_user_command(
  'LessLint',
  less_lint_quickfix,
  { desc = 'Run LESS linter and populate quickfix list' }
)
