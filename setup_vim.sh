#!/bin/sh

cp .vimrc ~/.vimrc
mkdir -p ~/.vim/rc
cp dein.toml ~/.vim/rc/dein.toml
cp dein_lazy.toml ~/.vim/rc/dein_lazy.toml

vim

exit 0
