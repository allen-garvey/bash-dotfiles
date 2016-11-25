#Aliases for Ubuntu

#built ins declared before shared
alias grepc="grep -nrP --color=auto"

source "${DOTFILES_DIR}aliases_shared.bash"

#alias for bash settings
alias settings="subl ~/.bashrc \"${DOTFILES_DIR}\""
alias reload="source ~/.bashrc"

#GIT
#open stack overflow to add part of file in git to staging
alias git_part="sensible-browser \"http://stackoverflow.com/questions/1085162/commit-only-part-of-a-file-in-git\";"

alias gitup="git-cola &"

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
alias node="nodejs"

#apache
alias apache="sudo service apache2"

#nginx
alias nginx="sudo service nginx"
#function ng() { sudo systemctl $1 nginx; }

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

#aliases for network drives
alias netdrives="cddirls ~/Network_Drives"
#mount flip to filesystem
alias mount_flip="sshfs  garveya@access.engr.oregonstate.edu:/nfs/stak/students/g/garveya/ ~/Network_Drives/flip/"