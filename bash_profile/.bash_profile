. ~/.bashrc

if ! echo $PATH | grep ~/bin &>/dev/null; then
	export PATH=~/bin:$PATH:.
fi

export MAILCHECK=-1
export EDITOR=joe
export PAGER=less
export LESS=-SfR
export ignoreeof=0

export HISTFILESIZE=750000
export HISTSIZE=5000
export HISTCONTROL=ignoreboth
#export LC_COLLATE=POSIX

if [ "$UID" = "0" ]
then
	PS1="${PS1}# "
else
	PS1="${PS1}$ "
fi
