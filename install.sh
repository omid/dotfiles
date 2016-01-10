#!/usr/bin/env bash

# clone main repository
git clone --depth=1 https://github.com/omid/dotfiles.git ~/.dotfiles

### ZSH
ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc

### GIT
if [ -f ~/.gitconfig ]; then
    mv ~/.gitconfig ~/.gitconfig_local
fi
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig

### TMUX
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf

### AXEL
ln -sf ~/.dotfiles/axelrc ~/.axelrc



