[[ -f "/etc/bash_completion" ]] && source "/etc/bash_completion"
[[ -d "$HOME/.bash_profile.d" ]] && for i in $HOME/.bash_profile.d/*[a-zA-Z0-9]; do source $i; done

shopt -s checkwinsize no_empty_cmd_completion
umask 022

# for added safety of history
export HISTFILESIZE=750000
export HISTSIZE=5000
export HISTCONTROL=ignoredups
