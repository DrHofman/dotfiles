if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
alias ll='ls -l'
alias lf='ls -F'
alias vimrc='nvim ~/.vim/plugins.vim'
alias bashrc='nvim ~/.bash_profile'
alias gclean="git checkout master; git pull origin master; git fetch --all -p; git branch -vv | grep \": gone]\" | awk '{ print \$1 }' | xargs -n 1 git branch -d"
alias dns-reset="sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache"
alias me="ssh -o ServerAliveInterval=60 ec2-user@52.209.87.201 -i ~/.ssh/daniel-zitzman-aws-account.pem"
alias runner="ssh -o ServerAliveInterval=60 ec2-user@52.50.72.128"
alias besedo="ssh -o ServerAliveInterval=60 ec2-user@gitlab.besedo.com"
alias dayreport="ssh -o ServerAliveInterval=60 172.26.253.11"
alias proxy="ssh -o ServerAliveInterval=60 172.26.253.11"
alias dictionary="nvim /Users/danielzitzman/Library/Spelling/LocalDictionary"
alias vimsync="nvim +PlugUpgrade +PlugClean! +PlugUpdate +qa"
alias notes="cd notes; nvim"
alias workers="osascript /Users/danielzitzman/projects/aws-workers.applescript"
alias loadbalancers="osascript /Users/danielzitzman/projects/aws-nginx.applescript"
alias logstash="osascript /Users/danielzitzman/projects/aws-logstash.applescript"
alias ops="cd /Users/danielzitzman/projects/ops-tools-infrastructure"
alias d="osascript /Users/danielzitzman/projects/dev-env.applescript"
alias dv="cd /Users/danielzitzman/projects/ops-tools-infrastructure; vagrant ssh"
alias vim=nvim

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Use homebrew python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# current dir in iterm tab title
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

export NVM_DIR="/Users/danielzitzman/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
. "/Users/danielzitzman/.acme.sh/acme.sh.env"

nvm use v8

export PATH="/usr/local/sbin:$PATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

function dockerMachine {
  STATUS="$(docker-machine status $1)"

  if [ $STATUS != "Running" ]; then
      RES="$(docker-machine start $1)"
      echo $RES
  else
      echo $STATUS
  fi
}

