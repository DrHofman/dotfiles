# Some sanity

export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh --no-use"

alias ll='ls -la'
alias lf='ls -F'
alias vimrc='nvim ~/.vim/plugins.vim'
alias bashrc='nvim ~/.bash_profile'
alias gclean="git checkout master; git pull origin master; git fetch --all -p; git branch -vv | grep \": gone]\" | awk '{ print \$1 }' | xargs -n 1 git branch -d"
alias dns-reset="sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache"
alias me="ssh -o ServerAliveInterval=60 ec2-user@52.209.87.201"
alias dictionary="nvim /Users/danielzitzman/Library/Spelling/LocalDictionary"
alias vimsync="nvim +PlugUpgrade +PlugClean! +PlugUpdate +qa"
alias notes="cd /Users/danielzitzman/notes; nvim"
alias vim=nvim
alias vi=nvim
alias lop="lsof -i -P -n | grep LISTEN"

alias staging="osascript /Users/daniel.zitzman/projects/staging-worker.applescript"
alias production="osascript /Users/daniel.zitzman/projects/production-worker.applescript"

# current dir in iterm tab title
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

export PATH="/usr/local/sbin:~/.composer/vendor/bin/:$PATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=nvim

# GIG related stuff
alias g='cd ~/projects/gig'
alias r='cd ~/projects/gig/rizk'
alias d='cd ~/projects/gig/rizk-devenv'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
