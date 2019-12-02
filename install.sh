#!/bin/bash
set -e

# TODO: make dynamic using realpath $0
DIR="$HOME/dotfiles"

#List of files
BASH_FILES=(bashrc bash_profile)
ZSH_FILES=(zshrc zshenv)
MISC_FILES=(tmux.conf inputrc xinitrc alacritty.yml gitconfig)

# TODO: backup files if they exist

## Symlink
# Symlink Bash files
# TODO: don't assume where dotfiles repo is
for f in "${BASH_FILES[@]}"; do
	ln -sfT "$DIR/bash/$f" "$HOME/.$f"
done

for f in "${ZSH_FILES[@]}"; do
	ln -sfT "$DIR/zsh/$f" "$HOME/.$f"
done

# Symlink scripts
ln -sfT "$DIR/scripts/pacback" "$HOME/.local/bin/pacback"

# Symlink Misc Files
for f in "${MISC_FILES[@]}"; do
	ln -sfT "$DIR/$f" "$HOME/.$f"
done

# Oddball
ln -sfT "$DIR/xmonad" "$HOME/.xmonad"
ln -sfT "$DIR/doom/" "$HOME/.doom.d"

if [[ -d "$HOME/.stack" ]]; then
    ln -sfT "$DIR/stack/config.yaml" "$HOME/.stack/config.yaml"
    ln -sfT "$DIR/stack/global-stack.yaml" "$HOME/.stack/global-project/stack.yaml"
fi
