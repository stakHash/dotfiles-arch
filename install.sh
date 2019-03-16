#!/bin/bash

#########################################################
################## Arch Linux ###########################
#########################################################

DOTFILES_DIR=$(cd $(dirname $0);pwd)

# install dot (dotfiles manager)
bash $DOTFILES_DIR/scripts/install_dot.sh

# install packages
sudo pacman -Syu base-devel git fish python python-pip neovim

# deploy dotfiles
export DOT_REPO="https://github.com/tksn-jp/dotfiles-arch.git"
export DOT_DIR="$HOME/.dotfiles"
dot clone && dot set -v

# install python3-neovim
sudo pip install neovim pip-review

# install dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $DOTFILES_DIR/.vim/dein/installer.sh
sh $DOTFILES_DIR/.vim/dein/installer.sh $DOTFILES_DIR/.vim/dein

# install trizen (AUR manager)
git clone https://aur.archlinux.org/trizen.git $HOME/trizen
cd $HOME/trizen
makepkg -si

# install tmux
sudo pacman -Syu tmux ruby
mkdir -p $HOME/.tmux/plugins
gem install tmuxinator
# install tpm (tmux plugin manager)
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
/bin/bash $HOME/.tmux/plugins/tpm/scripts/install_plugins.sh

# install fisher (fish plugin manager) & plugins
trizen -Syu fisher

