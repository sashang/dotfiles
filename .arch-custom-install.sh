#!/bin/bash

sudo pacman -Syu
sudo pacman -S syslog-ng
systemctl enable syslog-ng.service
systemctl restart syslog-ng.service
sudo pacman -S gcc ghc
sudo pacman -S xorg xorg-xinit xorg-xclock xorg-twm xmonad dmenu xmonad-contrib
sudo pacman -S cabal-install
cabal update
cabal install xmobar
sudo pacman -S gvim tmux
sudo pacman -S firefox mutt pwsafe
sudo pacman -S ttf-inconsolata ttf-dejavu
mkdir -p $HOME/code/dotfiles
mkdir -p $HOME/.vim/bundle
ln -sf $HOME/bin/xmobar $HOME/.cabal/bin/xmobar
ln -sf $HOME/code/dotfiles/.xmobar $HOME/.xmobar 
ln -sf $HOME/code/dotfiles/xmonad/xmonad.hs $HOME/.xmonad/xmonad.hs 
xmonad --recompile

