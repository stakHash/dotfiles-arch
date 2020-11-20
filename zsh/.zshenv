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

export PYENV_ROOT="$HOME/.pyenv"

export DefaultIMModule=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

# libreoffice dark theme
export VCL_ICONS_FOR_DARK_THEME=1

## perl
export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"$HOME/perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"

path=(
	$HOME/perl5/bin
	$HOME/.node_modules/bin
	$HOME/.cargo/bin
	$GOPATH/bin
	$GOENV_ROOT/bin
	$ANDROID_SDK_ROOT
	$PYENV_ROOT/bin
	$HOME/.nodenv/bin
	$HOME/.yarn/bin
	$HOME/.local/bin
	$path
)

eval "$(goenv init -)"
eval "$(nodenv init -)"
#eval "$(gh completion -s zsh)"
#eval "$(pyenv init -)"

