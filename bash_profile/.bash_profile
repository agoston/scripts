. ~/.bashrc

if ! echo $PATH | grep ~/bin &>/dev/null; then
	export PATH=~/bin:$PATH:/opt/local/bin:/opt/local/sbin:.
fi

shopt -s checkwinsize no_empty_cmd_completion

export MAILCHECK=-1
export EDITOR=joe
export PAGER=less
export LESS=-SfR
export ignoreeof=0

# atm j9 has a lot of troubles, do not make it default
switch_java 1.8
