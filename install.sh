#!/usr/bin/env bash

if [ -f ~/.dotfiles ]; then
    echo 'Please remove or rename "~/.dotfiles" directory" first'
    exit
fi;

### check dependencies
if ! type git > /dev/null; then
    echo 'Please install git before starting'
    exit
fi

if ! type zsh > /dev/null; then
    echo 'Please install zsh before starting'
    exit
fi

if ! type tmux > /dev/null; then
    echo 'Please install tmux before starting'
    exit
fi

if ! type axel > /dev/null; then
    echo 'Please install axel before starting'
    exit
fi

### clone main repository
echo 'Cloning dotfiles...'
git clone --depth=1 https://github.com/omid/dotfiles.git ~/.dotfiles > /dev/null

### ZSH
if [ ! -f ~/.zsh_local ]; then
    cp ~/.dotfiles/zsh/zsh_local ~/.zsh_local
fi
ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc

### GIT
if [ -f ~/.gitconfig ]; then
    mv ~/.gitconfig ~/.gitconfig_local
fi
if [ -f ~/.gitconfig_local ] && [ -z $(grep -q gitconfig_local ~/.gitconfig_local) ]; then
    rm -rf ~/.gitconfig_local
fi
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig

### TMUX
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf

### AXEL
ln -sf ~/.dotfiles/axelrc ~/.axelrc


### finalize
echo 'Finished. To change your default shell to ZSH, run "chsh -s $(grep /zsh$ /etc/shells | tail -1)"'
