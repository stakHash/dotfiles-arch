#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


########################################################
#######            dot settings                 ########
########################################################
export DOT_REPO="https://github.com/tksn-jp/dotfiles-arch.git"
export DOT_DIR="$HOME/.dotfiles"
fpath=($HOME/dot $fpath)  # <- for completion
source $HOME/dot/dot.sh

########################################################
#######           tmux settings                  #######
########################################################
export EDITOR="/usr/bin/nvim"

