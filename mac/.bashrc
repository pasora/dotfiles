alias vi='/usr/local/bin/vim'
alias ll='ls -al'
# GNU grep (Homebrewed)
alias grep='/usr/local/bin/ggrep'
# BSD grep (bundled)
alias bgrep='/usr/bin/grep'

function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

# k8s
alias k='/usr/local/bin/kubectl'
# k8s change context
alias kc='kubectx "$(kubectx | peco)"'

# ghq + peco
alias gcd='cd $(ghq list -p | peco)'
alias gcode='code $(ghq list -p | peco)'

source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"

export KUBE_PS1_DIVIDER=' '
export KUBE_PS1_SEPARATOR=''
PS1="\[\e[30;47m\][\[\e[m\]\[\e[30;47m\]\t\[\e[m\]\[\e[30;47m\]]\[\e[m\] \`kube_ps1 | sed -e 's/-.asahiko..ara-.* / /'\` \[\e[36m\]\`parse_git_branch\`\[\e[m\] \[\e[33m\]\w\[\e[m\] \\$  "

