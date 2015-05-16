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

echo "\n> set up symlink\n"
ln -sf $endpath/vimrc $HOME/.vimrc

echo "> create Vim folders"
mkdir -p $HOME/.vim/tmp/undo
mkdir -p $HOME/.vim/tmp/backup
mkdir -p $HOME/.vim/tmp/swap

if [ ! -e $HOME/.vim/autoload/plug.vim ]; then
    echo "> install vim-plug\n"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "\n> install plugins using vim-plug\n"
vim </dev/tty +PlugInstall +PlugClean +qall
