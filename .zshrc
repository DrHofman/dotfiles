# enable the default zsh completions!
autoload -Uz compinit && compinit

# Some sanity
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls -GwF'
alias ll='ls -alh'

alias vimrc='cd /Users/daniel.zitzman && nvim .config/nvim/init.vim'
alias vimplug='cd /Users/daniel.zitzman && sh vimplug.sh'
alias bashrc='nvim ~/.zshrc'
alias gitconfig='nvim ~/.gitconfig'
alias gclean="git checkout master; git pull origin master; git fetch --all -p; git branch -vv | grep \": gone]\" | awk '{ print \$1 }' | xargs -n 1 git branch -d"
alias dns-reset="sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache"
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
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND"
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
alias rd='cd ~/projects/gig/rizk'
alias rio='cd ~/projects/gig/rizk-io'
alias rfe='cd ~/projects/gig/rizk-fe'
alias rbo='cd ~/projects/gig/rizk-bo'
alias ra='cd ~/projects/gig/rizk-ansible'
alias es='cd ~/projects/gig/rizk-aws/rizk-elasticsearch'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Rizk Dev
alias rizk-flushall='cd ~/projects/gig/rizk && vagrant --tags=flushall,rizk provision'
alias rizk-tail='cd ~/projects/gig && tail -f rizk-app.log'
