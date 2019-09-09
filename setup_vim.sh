#!/bin/sh

if [ $# -ne 1 ];then
  echo "usage: ${0} os_name" 1>&2
  exit 1
fi

os=${1}

if [ ! -d ${os} ];then
  echo "Unknown OS name" 1>&2
  exit 1
fi
  
# .vimrc
diff ${os}/.vimrc ~/.vimrc
cp ${os}/.vimrc ~/.vimrc

# dein.toml
mkdir -p ~/.vim/rc
diff ${os}/dein.toml ~/.vim/rc/dein.toml
cp ${os}/dein.toml ~/.vim/rc/dein.toml

# dein_lazy.toml
diff ${os}/dein_lazy.toml ~/.vim/rc/dein_lazy.toml
cp ${os}/dein_lazy.toml ~/.vim/rc/dein_lazy.toml

mkdir -p ~/.vim/ftplugin

exit 0

