#!/bin/bash
## A pacman based 1st time personal environment setup script

package_list="gcc gnome firefox mutt pwsafe ttf-inconsolata ttf-dejavu gvim tmux"
sudo pacman -Syu
sudo pacman -S syslog-ng
systemctl enable syslog-ng.service
systemctl restart syslog-ng.service
sudo pacman --noconfirm -S $package_list
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#create directoies.
[ -z "$HOME/.vim/bundle" ] || mkdir -p "$HOME/.vim/bundle"
[ -z "$HOME/.config/fish/functions" ] || mkdir -p "$HOME/.config/fish/functions"
[ -z "$HOME/.mutt/" ] || mkdir -p "$HOME/.config"
#setup symlinks
ln -sf "$HOME/code/dotfiles/.vimrc" "$HOME/.vimrc"
ln -sf "$HOME/code/dotfiles/.bashrc" "$HOME/.bashrc"
ln -sf "$HOME/code/dotfiles/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$HOME/code/dotfiles/.mutt/muttrc" "$HOME/.mutt/muttrc"
ln -sf "$HOME/code/dotfiles/.mutt/theme" "$HOME/.mutt/theme"

