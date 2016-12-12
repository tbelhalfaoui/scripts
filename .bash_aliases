#!/bin/bash

###############################
###           Git           ###
###############################

alias gst='git status'
alias gpl='git pull'
alias gco='git checkout'
alias gci='git commit'
alias ga='git add'
alias gaa='git add . -A'
alias gd='git diff'
alias grc='git rebase --continue'
alias gp='git push'
alias gsh='git stash'
alias gf='git fetch'

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[32m\]\u@\h \[\033[94m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

#############################
###          Misc         ###
#############################

function grepkill {
	ps -aux | grep $1 | awk '{print $2}' | while read id; do kill $id; done
}

# Files
alias open=xdg-open
alias rm=trash-put

# Copy & paste 
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# Touchpad
synclient TapButton2=3 TapButton3=0

alias sum="awk '{s+=\$1} END {printf \"%.0f\", s}'"

##############################
###         Scan           ###
##############################

function mergeimages {
	convert -monitor -compress jpeg -quality 50 $1 $2
}

function scan {
	next_page=true
	output=$1
	function onexit {
		echo $output
		if $next_page
		then
			next_page=false
			mergeimages "scan-tmp-*.tiff" $output
			rm scan*.tiff
		fi
		return 0


	}
	trap onexit SIGINT

	i=0
	while $next_page
	do
		scanimage --format tiff --resolution 300dpi -v -p > "scan-tmp-$i.tiff"
		read -n1 -rsp $'Press any key to scan next page or Ctrl+C to exit...\n'
		((i++))
	done
}
