zle -N peco-history-selection
zle -N peco-z-search
zle -N peco-ghq-list
bindkey '^r' peco-history-selection
bindkey '^e' peco-z-search
bindkey '^g' peco-ghq-list

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
	which peco > /dev/null
	if [ $? -ne 0 ]; then
		echo "install peco"
		return 1
	fi
	BUFFER=`history -n 1 | tac -r | awk '!a[$0]++' | peco`
	CURSOR=$#BUFFER
	zle reset-prompt
}

function peco-ghq-list() {
	which peco ghq > /dev/null
	if [ $? -ne 0 ]; then
		echo "install peco & ghq"
		return 1
	fi
	local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
	if [ -n "$selected_dir" ]; then
		BUFFER="cd ${selected_dir}"
		zle accept-line
	fi
}
