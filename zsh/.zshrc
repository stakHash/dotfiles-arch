##
## CAUTION:
##	path should be set in zprofile, not here!
##

### auto compile
if [ $HOME/.dotfiles/zsh/.zshrc -nt $HOME/.zshrc.zwc ]; then
	zcompile $HOME/.zshrc
fi

autoload -U compinit promptinit
compinit
promptinit

# enable help command
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
unalias run-help
alias help=run-help

setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_find_no_dups

#######################################################################################
####                              aliases                                          ####
#######################################################################################
alias sudo='sudo '
alias la='ls -la'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias pow='powerpill'

#######################################################################################
####                         oh-my-zsh with antigen                                ####
#######################################################################################
source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh
antigen bundle extract

############################### plugins #########################################

## suggest package for invalid command
antigen bundle command-not-found
## directory listing with git status
antigen bundle supercrabtree/k
alias lk='k -a'
## cd to repository root
antigen bundle mollifier/cd-gitroot
alias cdg='cd-gitroot'
## z fork by knu
antigen bundle knu/z
## back directory
antigen bundle Tarrasch/zsh-bd
## Syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting
## additional completion
antigen bundle zsh-users/zsh-completions
## 256color
antigen bundle chrissicool/zsh-256color
## url check
antigen bundle ascii-soup/zsh-url-highlighter
## emoji
antigen bundle b4b4r07/emoji-cli
## historical substring completion
antigen bundle zsh-users/zsh-history-substring-search
## auto suggestion like fish
antigen bundle zsh-users/zsh-autosuggestions
## extractor

## theme
antigen theme bureau

## Tell Antigen that you're done.
antigen apply

bindkey '^j' history-substring-search-up
bindkey '^k' history-substring-search-down
# bindkey -M vicmd 'k' history-substring-search-up
# bindkey -M vicmd 'j' history-substring-search-down

# zle -N zle-line-init
# zle -N zle-keymap-select

### peco
function peco-z-search() {
	which peco z > /dev/null
	if [ $? -ne 0 ]; then
		echo "install peco & z"
		return 1
	fi
	local res=$(z | sort -rn | cut -c 12- | peco)
	if [ -n "$res" ]; then
		BUFFER+="cd $res"
		zle accept-line
	else
		return 1
	fi
}
function peco-history-selection() {
	BUFFER=`history -n 1 | tac -r | awk '!a[$0]++' | peco`
	CURSOR=$#BUFFER
	zle reset-prompt
}
zle -N peco-history-selection
zle -N peco-z-search
bindkey '^r' peco-history-selection
bindkey '^e' peco-z-search

