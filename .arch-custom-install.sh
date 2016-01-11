#!/bin/bash
## A pacman based 1st time personal environment setup script

cat << "EOF" >> /etc/pacman.conf
[infinality-bundle]
Server = http://bohoomil.com/repo/$arch

[infinality-bundle-multilib]
Server = http://bohoomil.com/repo/multilib/$arch

[infinality-bundle-fonts]
Server = http://bohoomil.com/repo/fonts
EOF

package_list="gcc git firefox mutt pwsafe ttf-inconsolata ttf-dejavu vim tmux \
    fish network-manager-applet openvpn i3-wm rxvt-unincode feh scrot \
    xorg inifinality-bundle xorg-xinit vim-jellybeans ctags xautolock"
sudo pacman -Syu
sudo pacman -S syslog-ng
systemctl enable syslog-ng.service
systemctl restart syslog-ng.service
sudo pacman --noconfirm -S $package_list
#create directoies.
[ -z "$HOME/code" ] || mkdir -p "$HOME/code"
[ -z "$HOME/.vim/bundle" ] || mkdir -p "$HOME/.vim/bundle"
[ -z "$HOME/.config/fish/functions" ] || mkdir -p "$HOME/.config/fish/functions"
[ -z "$HOME/.mutt/" ] || mkdir -p "$HOME/.mutt"

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git@github.com:sashang/dotfiles.git ~/code/dotfiles
#setup symlinks
ln -sf "$HOME/code/dotfiles/.vimrc" "$HOME/.vimrc"
ln -sf "$HOME/code/dotfiles/.bashrc" "$HOME/.bashrc"
ln -sf "$HOME/code/dotfiles/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$HOME/code/dotfiles/.mutt/muttrc" "$HOME/.mutt/muttrc"
ln -sf "$HOME/code/dotfiles/.mutt/theme" "$HOME/.mutt/theme"
ln -sf "$HOME/code/dotfiles/.gitconfig" "$HOME/.gitconfig"
ln -sf "$HOME/code/dotfiles/.config/fish/functions/fish_prompt.fish" "$HOME/.config/fish/functions/fish_prompt.fish"
ln -sf "$HOME/code/dotfiles/.config/fish/config.fish" "$HOME/.config/fish/functions/config.fish"
ln -sf "$HOME/code/dotfiles/.config/xcolors" "$HOME/.config/xcolors"

