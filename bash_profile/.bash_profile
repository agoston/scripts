. ~/.bashrc

if ! echo $PATH | grep ~/bin &>/dev/null; then
	export PATH=~/bin:/usr/local/opt/coreutils/libexec/gnubin:$HOME/.cargo/bin:$PATH:.
fi

shopt -s checkwinsize no_empty_cmd_completion

export MAILCHECK=-1
export EDITOR=joe
export PAGER=less
export LESS=-SfR
export ignoreeof=0
