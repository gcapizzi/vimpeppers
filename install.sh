#!/usr/bin/env sh

echo "\033[1;34m# vimpeppers installer\033[0m"

# dependency check

command -v git >/dev/null 2>&1 || {

  echo >&2 "\033[1;31m✗ please install git prior to vimpeppers...\033[0m\n= aborted!\033[0m"; exit 1; }

command -v vim >/dev/null 2>&1 || {

  echo >&2 "\033[1;31m✗ please install vim prior to vimpeppers...\033[0m\n= aborted!\033[0m"; exit 1; }

echo "\033[1;32m✓ dependencies installed...\033[0m"

# cloning or updating repository

if [ -e "$HOME/.vimpeppers/.git" ]; then

  cd "$HOME/.vimpeppers" && git pull >/dev/null 2>&1 || {

    echo >&2 "\033[1;31m✗ unable to pull changes from remote repository [github]...\033[0m\n= aborted!\033[0m"; exit 1; }

  echo "\033[1;32m✓ updated local repository [github]...\033[0m"

else

  git clone https://github.com/ivoputzer/vimpeppers.git "$HOME/.vimpeppers" >/dev/null 2>&1 || {

    echo >&2 "\033[1;31m✗ unable to clone remote repository [github]...\033[0m\n= aborted!\033[0m"; exit 1; }

  echo "\033[1;32m✓ remote repository cloned [github]...\033[0m"

fi

# setting up symlinks

rm -f $HOME/.vimrc && ln -sf "$HOME/.vimpeppers"/vimrc $HOME/.vimrc >/dev/null 2>&1 || {

  echo >&2 "\033[1;31m✗ unable to create symlinks...\033[0m\n= aborted!\033[0m"; exit 1; }

echo "\033[1;32m✓ symlinks have been created...\033[0m"

# setting up folders

mkdir -p $HOME/.vim/tmp/undo $HOME/.vim/tmp/backup $HOME/.vim/tmp/swap >/dev/null 2>&1 || {

  echo >&2 "\033[1;31m✗ unable to create temporary folders...\033[0m\n= aborted!\033[0m"; exit 1; }

echo "\033[1;32m✓ temporary vim folders created...\033[0m"

# prepare vundle

if [ ! -e $HOME/.vim/bundle/vundle ]; then

  git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle >/dev/null 2>&1 || {

    echo >&2 "\033[1;31m✗ not able to clone and install vundle [github]...\033[0m\n= aborted!\033[0m"; exit 1; }

  echo "\033[1;32m✓ vundle has been installed...\033[0m"

else

  echo "\033[1;32m✓ vundle installed already...\033[0m"

fi

echo "\033[1;32m✓ launching vundle, let's update the fancy stuff...\033[0m"

vim </dev/tty +BundleInstall! +BundleClean +qall

# we're finally done

echo "\033[1;32m= done!\033[0m"
