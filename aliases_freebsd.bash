#aliases and functions for freebsd

#don't store repeated duplicate commands in bash_history
export HISTCONTROL=ignoreboth:erasedups

#basic shell setup to mimic ubuntu
if [ ! -z "$BASH_DOTFILES_IS_PRODUCTION" ]; then
	local user_color='31'
else
	local user_color='32'
fi
export PS1="\[\033[01;${user_color}m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
export LSCOLORS='dxfxcxdxbxegedabagacad'; 
export PAGER=less
export EDITOR=vim
alias grepc="grep -nr --color=always"

source "${DOTFILES_DIR}aliases_shared.bash"

alias reload="source ~/.bash_profile"
alias bash_profile="vim ~/.bash_profile;"

#built ins

#list rcvars to use for /etc/rc.conf
alias rcvars="grepc rcvar /usr/local/etc/rc.d/*"

#directories
alias localetc="cddirls /usr/local/etc"

#nginx
alias nginx="service nginx"

#add site configuration file in 
#sites-available to sites enabled
#first argument should be name of site configuration file
#in sites available
function nginx_enable_site() {
	if [[ "$#" -ne 1 ]] ; then
    	>&2 echo "usage: ${FUNCNAME[0]} <site-configuration-filename>"
    	return 1;
	fi

	ln -s "/usr/local/etc/nginx/sites-available/$1" "/usr/local/etc/nginx/sites-enabled/$1"
}


