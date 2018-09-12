# Some sanity

alias ll='ls -la'
alias lf='ls -F'
alias vimrc='nvim ~/.vim/plugins.vim'
alias bashrc='nvim ~/.bash_profile'
alias gclean="git checkout master; git pull origin master; git fetch --all -p; git branch -vv | grep \": gone]\" | awk '{ print \$1 }' | xargs -n 1 git branch -d"
alias dns-reset="sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache"
alias me="ssh -o ServerAliveInterval=60 ec2-user@52.209.87.201"
alias dictionary="nvim /Users/danielzitzman/Library/Spelling/LocalDictionary"
alias vimsync="nvim +PlugUpgrade +PlugClean! +PlugUpdate +qa"
alias notes="cd notes; nvim"
alias dv="cd /Users/danielzitzman/projects/ops-tools-infrastructure; vagrant ssh"
alias vim=nvim
alias vi=nvim

# current dir in iterm tab title
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

export PATH="/usr/local/sbin:$PATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
