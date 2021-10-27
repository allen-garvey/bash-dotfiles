#Aliases for Ubuntu

#flatpak
# alias gimp-flatpak="flatpak run org.gimp.GIMP"

#built ins declared before shared
alias grepc="grep -nrP --color=auto"

source "${DOTFILES_DIR}aliases_shared.bash"

#set prompt dynamically so git branch is always correct
PROMPT_COMMAND="set_ps1"

function set_ps1(){
	local first_part='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \[\033[00m\]('
	local git_branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
	local last_part=')\[\033[00m\]\$ '
	export PS1="$first_part$git_branch$last_part"
}

# export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \[\033[00m\]($(git branch 2>/dev/null | grep '^*' | colrm 1 2))\[\033[00m\]\$ "

#alias for bash settings
alias settings="subl ~/.bashrc \"${DOTFILES_DIR}\""
alias reload="source ~/.bashrc"
function bash_profile() {
	if [ -x "$(command -v subl)" ]; then
		subl ~/.bashrc;
	else
		vim ~/.bashrc;
	fi
}

#sublime text
alias sublime-snippets="cddir ~/.config/sublime-text-3/Packages/User/sublime-snippets"

#GIT
#open stack overflow to add part of file in git to staging
#alias git_part="sensible-browser \"http://stackoverflow.com/questions/1085162/commit-only-part-of-a-file-in-git\";"

alias gitup="git-cola > /dev/null 2>&1 &"

#APT
alias apt-get="sudo apt-get"
alias apt="sudo apt"
alias aptu="sudo apt update && apt list --upgradable"
alias aptg="sudo apt install"

#alias to open current directory in file browser
if [ "$XDG_CURRENT_DESKTOP" = "KDE" ]; then
	alias op="dolphin . --new-window > /dev/null 2>&1 &"
#unity
else
	alias op="nautilus . > /dev/null 2>&1"
fi

#apache
#alias apache="sudo service apache2"

#nginx
alias nginx="sudo service nginx"

#openresty
alias openresty="sudo service openresty"

alias openresty_check_config="sudo openresty -t"

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

#add site configuration file in 
#sites-available to sites enabled
#first argument should be name of site configuration file
#in sites available
function openresty_enable_site() {
	if [[ "$#" -ne 1 ]] ; then
    	>&2 echo "usage: ${FUNCNAME[0]} <site-configuration-filename>"
    	return 1;
	fi

	sudo ln -s "/etc/openresty/sites-available/$1" "/etc/openresty/sites-enabled/$1"
}

#redis
#assumes redis installed and configured from:
#https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-redis-on-ubuntu-16-04
alias redis_start="sudo systemctl start redis"


# alias for ebook-convert epub book to azw3
function econvert() {
	if [[ "$#" -ne 1 ]] ; then
    	>&2 echo "usage: ${FUNCNAME[0]} <filename-of-book-to-convert>"
    	return 1;
	fi

	local source_filename="$1"
	local destination_filename="${source_filename%.*}.azw3"

	time ebook-convert "$source_filename" "$destination_filename"
}

#directories
alias pic="cddir ~/Pictures"

source "${SHARED_INCLUDES_DIR}sshfs.bash"

#mix for elixir
export PATH="/usr/local/bin:$PATH"