set foldmethod=manual
set foldlevelstart=1

au BufWinLeave ?* mkview
au BufWinEnter ?* silent! loadview
