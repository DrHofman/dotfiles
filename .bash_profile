# Some sanity

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion #bash completion

alias ll='ls -la'
alias lf='ls -F'
alias vimrc='cd /Users/daniel.zitzman; nvim ~/.vim/plugins.vim'
alias bashrc='nvim ~/.bash_profile'
alias gclean="git checkout master; git pull origin master; git fetch --all -p; git branch -vv | grep \": gone]\" | awk '{ print \$1 }' | xargs -n 1 git branch -d"
alias dns-reset="sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache"
alias dictionary="nvim /Users/danielzitzman/Library/Spelling/LocalDictionary"
alias vimsync="nvim +PlugUpgrade +PlugClean! +PlugUpdate +qa"
alias notes="cd /Users/daniel.zitzman/notes; nvim"
alias vim=nvim
alias vi=nvim
alias lop="lsof -i -P -n | grep LISTEN"
alias todo="cd /Users/daniel.zitzman/notes && nvim TODO.md"

alias gpm="npm list -g --depth 0"
source "/Users/daniel.zitzman/.bash_profile_secret"

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
alias ra='cd ~/projects/gig/rizk-aws'

# Open project
alias r='cd ~/projects/gig/rizk && vim'
alias ar='cd ~/projects/gig/rizk-ansible && vim'
alias bo='cd ~/projects/gig/rizk-bo && vim'
alias d='cd ~/projects/gig/devenv-vagrant && vim'
alias es='cd ~/projects/gig/rizk-aws/rizk-elasticsearch && vim'

export PATH="$PATH:/Applications/Muse"

export DYLD_FALLBACK_LIBRARY_PATH="$DYLD_FALLBACK_LIBRARY_PATH:/Applications/Muse"
