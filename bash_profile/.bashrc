[[ -d "$HOME/.bash_profile.d" ]] && for i in $HOME/.bash_profile.d/*[a-zA-Z0-9]; do source $i; done

umask 022

# for added safety of history
export HISTFILESIZE=750000
export HISTSIZE=5000
export HISTCONTROL="ignorespace:erasedups"
