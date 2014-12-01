#!/bin/bash

sudo pacman -Syu
sudo pacman -S syslog-ng
systemctl enable syslog-ng.service
systemctl restart syslog-ng.service
sudo pacman --noconfirm -S gcc ghc
sudo pacman --noconfirm -S xorg xorg-xinit xorg-xclock xorg-twm xmonad dmenu xmonad-contrib
sudo pacman --noconfirm -S cabal-install
cabal update
cabal install xmobar
sudo pacman --noconfirm -S gvim tmux
sudo pacman --noconfirm -S firefox mutt pwsafe
sudo pacman --noconfirm -S ttf-inconsolata ttf-dejavu
mkdir -p $HOME/code/dotfiles
mkdir -p $HOME/.vim/bundle
ln -sf $HOME/bin/xmobar $HOME/.cabal/bin/xmobar
ln -sf $HOME/code/dotfiles/.xmobar $HOME/.xmobar 
ln -sf $HOME/code/dotfiles/xmonad/xmonad.hs $HOME/.xmonad/xmonad.hs 
xmonad --recompile
cat << EOF > $HOME/.xinitrc
xsetroot -cursor_name left_ptr
exec xmonad
EOF

