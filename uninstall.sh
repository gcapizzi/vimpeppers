#!/usr/bin/env sh

echo "\033[1;34m# vimpeppers uninstaller\033[0m"

if [ -d "$HOME/.vimpeppers" ]; then

	echo "\033[1;32m✓ removing directories...\033[0m"

  rm -rf "$HOME/.vimpeppers"

  rm -rf "$HOME/.vim/bundle/*"

else

  echo "\033[1;31m✗ unable to locate folders...\033[0m"

fi

if [ -h "$HOME/.vimrc" ]; then

	echo "\033[1;32m✓ removing symlinks...\033[0m"

	rm -f "$HOME/.vimrc"

else

  echo "\033[1;31m✗ unable to locate symmlinks...\033[0m"

fi

echo "\033[1;32m= done\033[0m"