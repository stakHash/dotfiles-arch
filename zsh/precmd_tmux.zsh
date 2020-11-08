#!/bin/zsh

function precmd_tmux() {
  if [ ! -z $TMUX ]; then
    tmux refresh-client -S
  fi
}
