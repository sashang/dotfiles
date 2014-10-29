#!/bin/bash

sudo pacman -Sy
sudo pacman -S syslog-ng
systemctl enable syslog-ng.service
systemctl restart syslog-ng.service
sudo pacman -S gcc ghc
sudo pacman -S gvim
sudo pacman -S cabal-install
sudo pacman -S firefox
sudo pacman -S ttf-inconsolata
sudo pacman -S xorg xorg-xinit xorg-xclock xorg-twm xmonad dmenu dmenu dmenu
cabal install xmobar
mkdir -p $HOME/code/dotfiles
mkdir -p $HOME/.vim/bundle
ln -sf $HOME/.cabal/bin/xmobar $HOME/bin/xmobar
ln -sf $HOME/.xmobar $HOME/code/dotfiles/.xmobar
ln -sf $HOME/.xmonad/xmonad.hs $HOME/code/dotfiles/xmonad/xmonad.hs
xmonad --recompile

