#!/usr/bin/env sh

endpath="$HOME/.vimpeppers"

echo "\n### Bootstrap started ###"

if [ -e $endpath/.git ]; then
    echo "\n> update repo\n"
    cd $endpath && git pull
else
    echo "\n> clone repo\n"
    git clone http://github.com/gcapizzi/vimpeppers.git $endpath
fi

echo "> set up symlink\n"
ln -sf $endpath/vimrc $HOME/.vimrc

echo "> create Vim folders"
mkdir -p $HOME/.vim/tmp/undo
mkdir -p $HOME/.vim/tmp/backup
mkdir -p $HOME/.vim/tmp/swap

if [ ! -e $HOME/.vim/bundle/Vundle.vim ]; then
    echo "> install Vundle\n"
    git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

echo "\n> update/install plugins using Vundle\n"
vim </dev/tty +PluginInstall +PluginClean +qall
