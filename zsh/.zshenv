## set path
#
# example:
#   path=(~/bin /other/things/in/path $path[@])
#

export EDITOR="nvim"
export GOPATH="$HOME/.go"
export XDG_CONFIG_HOME="$HOME/.config/"

path=(
	$HOME/.cargo/bin
	$GOPATH/bin
	$path
)


