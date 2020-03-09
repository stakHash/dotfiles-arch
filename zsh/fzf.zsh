zle -N fzf-history-selection
zle -N fzf-z-search
zle -N fzf-ghq-list
zle -N fzf-find
bindkey '^r' fzf-history-selection
bindkey '^e' fzf-z-search
bindkey '^g' fzf-ghq-list
bindkey '^t' fzf-find

function fzf-z-search() {
	which fzf z > /dev/null
	if [ $? -ne 0 ]; then
		echo "install fzf & z"
		return 1
	fi
	local res=$(z | sort -rn | cut -c 12- | fzf --height=70% --layout=reverse)
	if [ -n "$res" ]; then
		BUFFER+="cd $res"
		zle accept-line
	else
		return 1
	fi
}

function fzf-history-selection() {
	which fzf > /dev/null
	if [ $? -ne 0 ]; then
		echo "install fzf"
		return 1
	fi
	# BUFFER=`history -n 1 | tac -r | awk '!a[$0]++' | fzf --layout=reverse`
	BUFFER=`history -n 1 | tac -r | fzf --height=70% --layout=reverse`
	CURSOR=$#BUFFER
	zle reset-prompt
}

function fzf-ghq-list() {
	which fzf ghq > /dev/null
	if [ $? -ne 0 ]; then
		echo "install fzf & ghq"
		return 1
	fi
	local selected_dir=$(ghq list -p | fzf --height=70% --layout=reverse)
	if [ -n "$selected_dir" ]; then
		BUFFER="cd ${selected_dir}"
		zle accept-line
	fi
}

function fzf-find() {
	which fzf > /dev/null
	if [ $? -ne 0 ]; then
		echo "install fzf"
		return 1
	fi
	local dir
	dir=$(find ${1:-.} -path '*/' -prune -o -type d -print 2> /dev/null | fzf --height=70% --layout=reverse)
	if [ -n "$dir" ]; then
		BUFFER="cd $dir"
		zle accept-line
		# zle reset-prompt
	fi
}
