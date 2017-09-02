#Aliases for Ubuntu

#built ins declared before shared
alias grepc="grep -nrP --color=auto"

source "${DOTFILES_DIR}aliases_shared.bash"

#alias for bash settings
alias settings="subl ~/.bashrc \"${DOTFILES_DIR}\""
alias reload="source ~/.bashrc"

#sublime text
alias sublime-snippets="cddir ~/.config/sublime-text-3/Packages/User/sublime-snippets"

#GIT
#open stack overflow to add part of file in git to staging
alias git_part="sensible-browser \"http://stackoverflow.com/questions/1085162/commit-only-part-of-a-file-in-git\";"

alias gitup="git-cola > /dev/null 2>&1 &"

#APT
alias apt-get="sudo apt-get"
alias aptg="sudo apt-get install"

#alias to open current directory in file browser
if [ "$XDG_CURRENT_DESKTOP" = "KDE" ]; then
	alias op="dolphin . > /dev/null 2>&1 &"
#unity
else
	alias op="nautilus . > /dev/null 2>&1"
fi

#node
#alias node="/usr/bin/node"

#apache
alias apache="sudo service apache2"

#nginx
alias nginx="sudo service nginx"

#add site configuration file in 
#sites-available to sites enabled
#first argument should be name of site configuration file
#in sites available
function nginx_enable_site() {
	if [[ "$#" -ne 1 ]] ; then
    	>&2 echo "usage: ${FUNCNAME[0]} <site-configuration-filename>"
    	return 1;
	fi

	sudo ln -s "/etc/nginx/sites-available/$1" "/etc/nginx/sites-enabled/$1"
}

#redis
#assumes redis installed and configured from:
#https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-redis-on-ubuntu-16-04
alias redis_start="sudo systemctl start redis"

#adjust screen brightness for zenbook
#http://askubuntu.com/questions/696239/how-can-i-change-the-screen-brightness-on-zenbook-ux305-with-media-buttons
function brightness(){
	amount="$1"
	re='^1\.00?$|^0\.[1-9][0-9]*$'
	if ! [[ "$amount" =~ $re ]] ; then
	   echo "brightness- usage: brightness [0.1-1]" >&2; 
	   return 1;
	fi
	if [[ $(echo " $amount > 1" | bc) -eq 1 ]]; then
		amount="1"
	elif [[ $(echo " $amount < 0.1" | bc) -eq 1 ]]; then
		amount="0.1"
	fi
	xrandr --output eDP1 --brightness $amount
}


#directories
alias pic="cddir ~/Pictures"

source "${SHARED_INCLUDES_DIR}sshfs.bash"