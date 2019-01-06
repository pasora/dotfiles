#!/bin/sh

terminal=`uname -a`
case ${terminal} in
  Darwin* )
    # macOS
    echo "macOS"
    diff mac/.tmux.conf ~/.tmux.conf
    cp mac/.tmux.conf ~/.tmux.conf
    ./setup_vim.sh mac
    ;;
  *Msys | *Cygwin )
    # Windows
    echo "Windows"
    ;;
  *Android )
    # Termux on Android
    echo "Termux"
    ;;
  Linux* )
    # Linux
    echo "Linux"
    ;;
  * )
    echo "Unknown OS" 1>&2
    exit 1
    ;;
esac

exit 0

