#!/bin/bash

sudo pacman -Syu
sudo pacman -S syslog-ng
systemctl enable syslog-ng.service
systemctl restart syslog-ng.service
sudo pacman -S gcc ghc
sudo pacman -S xorg xorg-xinit xorg-xclock xorg-twm xmonad dmenu
sudo pacman -S cabal-install
cabal install xmobar
sudo pacman -S gvim tmux
sudo pacman -S firefox mutt pwsafe
sudo pacman -S ttf-inconsolata ttf-dejavu
mkdir -p $HOME/code/dotfiles
mkdir -p $HOME/.vim/bundle
ln -sf $HOME/.cabal/bin/xmobar $HOME/bin/xmobar
ln -sf $HOME/.xmobar $HOME/code/dotfiles/.xmobar
ln -sf $HOME/.xmonad/xmonad.hs $HOME/code/dotfiles/xmonad/xmonad.hs
xmonad --recompile

