#!/usr/bin/env sh

endpath="$HOME/.vimpeppers"

echo "\n### Bootstrap started ###"

echo "\n> clone repo\n"
git clone http://github.com/gcapizzi/vimpeppers.git $endpath

echo "> set up symlink\n"
ln -s $endpath/vimrc $HOME/.vimrc

if [ ! -e $HOME/.vim/bundle/vundle ]; then
    echo "> install Vundle\n"
    git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
fi

echo "\n> update/install plugins using Vundle\n"
vim +BundleInstall! +BundleClean +qall
