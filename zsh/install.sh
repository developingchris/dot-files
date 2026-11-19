#!/bin/sh

# oh-my-zsh lives inside the dotfiles (gitignored); keep our own ~/.zshrc
if test ! -d "$HOME/.dotfiles/.oh-my-zsh"
then
  ZSH="$HOME/.dotfiles/.oh-my-zsh" KEEP_ZSHRC=yes RUNZSH=no CHSH=no \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
