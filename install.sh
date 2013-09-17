#!/usr/bin/env sh

echo "# vimpeppers installer"

if [ -e "$HOME/.vimpeppers/.git" ]; then
    echo "\033[1;32m✓ updating repository...\033[0m"
    cd "$HOME/.vimpeppers" && git pull
else
	echo "\033[1;32m✓ cloning repository...\033[0m"
    git clone http://github.com/ivoputzer/vimpeppers.git "$HOME/.vimpeppers"
fi

echo "\033[1;32m✓ setting up symlinks...\033[0m"
ln -sf "$HOME/.vimpeppers"/vimrc $HOME/.vimrc

echo "\033[1;32m✓ creating vim folders...\033[0m"
mkdir -p $HOME/.vim/tmp/undo
mkdir -p $HOME/.vim/tmp/backup
mkdir -p $HOME/.vim/tmp/swap

if [ ! -e $HOME/.vim/bundle/vundle ]; then
	echo "\033[1;32m✓ installing vundle...\033[0m"
    git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
else
	echo "\033[1;32m✓ vundle installed already...\033[0m"
fi

echo "\033[1;32m✓ updating everything using vundle...\033[0m"

vim </dev/tty +BundleInstall! +BundleClean +qall

echo "\033[1;32m= done!\033[0m"