if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

source ~/.nvm/nvm.sh

export HISTSIZE=2000
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S %z '

export TMUX_TMP=~/tmp

export PATH=${PATH}:~/bin

# Golang
export GOPATH=~/GoProject
export PATH=${PATH}:${GOPATH}/bin

# Haskell
export PATH=${PATH}:~/.local/bin

