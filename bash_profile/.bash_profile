. ~/.bashrc

if ! echo $PATH | grep ~/bin &>/dev/null; then
	export PATH=~/bin:$PATH:.
fi

shopt -s checkwinsize no_empty_cmd_completion

export MAILCHECK=-1
export EDITOR=joe
export PAGER=less
export LESS=-SfR
export ignoreeof=0

export PS1="\\033[33m\\033[1m\\033[\$(c_pwd)\[\033[0;36m\]\$(__git_ps1)\\033[0m\\033[38m\\033[0m\015\012"

if [ "$UID" = "0" ]
then
	PS1="${PS1}# "
else
	PS1="${PS1}$ "
fi
