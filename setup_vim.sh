#!/bin/sh

cp -f .vimrc ~/.vimrc
mkdir -p ~/.vim/rc
cp -f dein.toml ~/.vim/rc/dein.toml
cp -f dein_lazy.toml ~/.vim/rc/dein_lazy.toml
cp -f .latexmkrc ~/.latexmkrc
mkdir -p ~/.vim/ftplugin
cp -f tex_quickrun.vim ~/.vim/ftplugin/tex_quickrun.vim

vim

exit 0
