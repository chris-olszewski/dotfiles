#!/bin/bash
set -e

# TODO: make dynamic using realpath $0
DIR="$HOME/dotfiles"

#List of files
BASH_FILES=(bashrc bash_profile)
MISC_FILES=(tmux.conf inputrc xinitrc alacritty.yml gitconfig)

# TODO: backup files if they exist

## Symlink
# Symlink Bash files
# TODO: don't assume where dotfiles repo is
for f in "${BASH_FILES[@]}"; do
	ln -sfT "$DIR/bash/$f" "$HOME/.$f"
done

# Symlink Misc Files
for f in "${MISC_FILES[@]}"; do
	ln -sfT "$DIR/$f" "$HOME/.$f"
done

# Oddball
ln -sfT "$DIR/xmonad.hs" "$HOME/.xmonad/xmonad.hs"
ln -sfT "$DIR/doom/" "$HOME/.doom.d"

if [[ ! -f "$HOME/.stack" ]]; then
    echo Setting up stack config
    ln -sfT "$DIR/stack/config.yaml" "$HOME/.stack/config.yaml"
    ln -sfT "$DIR/stack/global-stack.yaml" "$HOME/.stack/global-project/stack.yaml"
fi
