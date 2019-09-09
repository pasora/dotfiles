#!/bin/sh

terminal=`uname -a`
case ${terminal} in
  Darwin* )
    # macOS
    echo "macOS"
    for f in .bash_profile .bashrc .gitconfig .tmux.conf; do
      echo "##########"
      echo ${f}
      echo "##########"
      git diff --no-index mac/${f} ~/${f} && read -p "Continue? (y): " ans && case ${ans} in [yY]*) cp mac/${f} ~/${f};; *) exit;; esac
    done
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

