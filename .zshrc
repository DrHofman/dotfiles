export ZSH="/Users/dazi01/.oh-my-zsh"
export PATH="$PATH:/Users/dazi01/projects/betsson/wor/flutter/bin"

ZSH_THEME="simple"

plugins=(git macos redis-cli)

source $ZSH/oh-my-zsh.sh

alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls -GwF'
alias ll='ls -alh'

alias vimrc="cd /Users/$USER && nvim .config/nvim/init.lua"
alias vimplug="cd /Users/$USER && sh vimplug.sh"
alias bashrc='nvim ~/.zshrc'
alias gitconfig='nvim ~/.gitconfig'
alias gclean="git checkout master; git pull origin master; git fetch --all -p; git branch -vv | grep \": gone]\" | awk '{ print \$1 }' | xargs -n 1 git branch -d"
alias gcm="~/git-cleanup.sh"
alias mclean="git checkout main; git pull origin main; git fetch --all -p; git branch -vv | grep \": gone]\" | awk '{ print \$1 }' | xargs -n 1 git branch -d"
alias dns-reset="sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache"
alias vimsync="nvim +PlugUpgrade +PlugClean! +PlugUpdate +qa"
alias notes="cd /Users/$USER/notes; nvim"
alias vim=nvim
alias vi=nvim
alias lop="lsof -i -P -n | grep LISTEN"
alias todo="cd /Users/$USER/notes && nvim TODO.md"
alias shortcuts="nvim ~/.bash_profile_secret"

alias gpm="npm list -g --depth 0"
source "/Users/$USER/.bash_profile_secret"

# current dir in iterm tab title
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND"
fi

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

export PATH="/usr/local/sbin:~/.composer/vendor/bin/:$PATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=nvim
export WORKSPACE_PATH=/Users/dazi01/projects/betsson

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Set iTerm Tab Title to Current Working Directory
DISABLE_AUTO_TITLE="true"

iterm_tab_title() {
  echo -ne "\e]0;${PWD##*/}\a"
}
add-zsh-hook precmd iterm_tab_title

# ACME
. "/Users/dazi01/.acme.sh/acme.sh.env"

# Added by Amplify CLI binary installer
export PATH="$HOME/.amplify/bin:$PATH"
# OPS config
export OPS_DIR="$HOME/.ops"
export PATH="$HOME/.ops/bin:$PATH"
source "$HOME/.ops/scripts/bash_completion.sh"
# bun completions
[ -s "/Users/dazi01/.bun/_bun" ] && source "/Users/dazi01/.bun/_bun"

# bun
export BUN_INSTALL="/Users/dazi01/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# GOPATH for go Development
export GOPATH=$HOME/go
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.1.0/bin:$PATH"

PATH="/Users/dazi01/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/dazi01/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/dazi01/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/dazi01/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/dazi01/perl5"; export PERL_MM_OPT;

export PATH="/usr/local/opt/openjdk/bin:$PATH"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/dazi01/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
