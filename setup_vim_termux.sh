#!/data/data/com.termux/files/usr/bin/sh

cp -f .vimrc ~/.vimrc
mkdir -p ~/.vim/rc
cp -f dein.toml ~/.vim/rc/dein.toml
cp -f dein_lazy.toml ~/.vim/rc/dein_lazy.toml
mkdir -p ~/.vim/ftplugin

vim

exit 0
