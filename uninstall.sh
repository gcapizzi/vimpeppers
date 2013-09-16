#!/usr/bin/env sh

echo "# vimpeppers uninstaller"

if [ -d "$HOME/.vimpeppers" ]; then
	echo "\033[1;32m✓ removing directories...\033[0m"
	rm -rf "$HOME/.vimpeppers"
else
	echo "\033[1;31m! could not find directories... \033[0m"
fi

if [ -h "$HOME/.vimrc" ]; then
	echo "\033[1;32m✓ removing symlinks...\033[0m"
	rm "$HOME/.vimrc"
else
	echo "\033[1;31m! could not find symlinks... \033[0m"
fi

echo "\033[1;32m= done\033[0m"