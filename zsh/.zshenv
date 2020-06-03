## set path
#
# example:
#   path=(~/bin /other/things/in/path $path[@])
#

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export _Z_DATA="$HOME/.local/share/z/.z"
export EDITOR="/usr/bin/nvim"
export GOPATH="$HOME/go"
export GOENV_DISABLE_GOPATH=1
export GOENV_ROOT="$HOME/.goenv"
export GO111MODULE=on
export XDG_CONFIG_HOME="$HOME/.config/"
export ANDROID_HOME="$HOME/Android"
export ANDROID_SDK_ROOT="$ANDROID_HOME/Sdk"

export DefaultIMModule=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

# libreoffice dark theme
export VCL_ICONS_FOR_DARK_THEME=1

path=(
	$HOME/.cargo/bin
	$GOPATH/bin
	$GOENV_ROOT/bin
	$ANDROID_SDK_ROOT
	$path
)

eval "$(goenv init -)"
eval "$(gh completion -s zsh)"

