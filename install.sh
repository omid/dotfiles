#!/usr/bin/env bash

if [ -f ~/.dotfiles ]; then
    echo 'Please remove or rename "~/.dotfiles" directory" first'
    exit
fi;

# clone main repository
git clone --depth=1 https://github.com/omid/dotfiles.git ~/.dotfiles

### ZSH
if [ ! -f ~/.zsh_local ]; then
    cp ~/.dotfiles/zsh/zsh_local ~/.zsh_local
fi
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
