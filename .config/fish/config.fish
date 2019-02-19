# ------------------------- paths --------------------------
set -x GOPATH $HOME/go

set PATH \
	$HOME/.cargo/bin \
	$GOPATH/bin \
	$PATH

# ------------------- env -----------------------------------
set -x VISUAL nvim
set -x XDG_CONFIG_HOME $HOME/.config
set -x TERM xterm-256color
set -x fish_term24bit 1
set -x GO15VENDOREXPERIMENT 1
set -x LC_ALL ja_JP.UTF-8

# ------------------------------ aliases ------------------------
alias .. 'cd ../'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias chrome 'open -a "google chrome"'

# ------------------ other settings -----------------------------
set -U theme_display_user on
bind \cr 'peco_select_history (commandline -b)'

# ruby init
eval (rbenv init - | source)

