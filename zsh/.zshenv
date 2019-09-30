## set path
#
# example:
#   path=(~/bin /other/things/in/path $path[@])
#

export _Z_DATA="$HOME/.local/share/z/.z"
export EDITOR="nvim"
export GOPATH="$HOME/go"
export GOENV_DISABLE_GOPATH=1
export GOENV_ROOT="$HOME/.goenv"
export GO111MODULE=on
export XDG_CONFIG_HOME="$HOME/.config/"
export ANDROID_HOME="$HOME/Android"
export ANDROID_SDK_ROOT="$ANDROID_HOME/Sdk"

path=(
	$HOME/.cargo/bin
	$GOPATH/bin
	$GOENV_ROOT/bin
	$ANDROID_SDK_ROOT
	$path
)

eval "$(goenv init -)"

