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



#######################################################################################
####                              aliases                                          ####
#######################################################################################
alias la='ls -la'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'


#######################################################################################
####                         oh-my-zsh with antigen                                ####
#######################################################################################
source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

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
## peco wrapper
antigen bundle mollifier/anyframe
alias aw='anyframe-widget-select-widget'
## enhanced cd
antigen bundle b4b4r07/enhancd
## historical substring completion
antigen bundle zsh-users/zsh-history-substring-search
## auto suggestion like fish
antigen bundle zsh-users/zsh-autosuggestions

## theme
antigen theme bureau

## Tell Antigen that you're done.
antigen apply

bindkey '^i' anyframe-widget-put-history
bindkey '^x^i' anyframe-widget-put-history
bindkey '^xi' anyframe-widget-put-history
bindkey '^j' history-substring-search-up
bindkey '^k' history-substring-search-down
# bindkey -M vicmd 'k' history-substring-search-up
# bindkey -M vicmd 'j' history-substring-search-down

# zle -N zle-line-init
# zle -N zle-keymap-select

