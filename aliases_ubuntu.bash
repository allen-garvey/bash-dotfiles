#Aliases for Ubuntu

#flatpak
# alias gimp-flatpak="flatpak run org.gimp.GIMP"

#built ins declared before shared
alias grepc="grep -nrP --color=auto"

source "${DOTFILES_DIR}aliases_shared.bash"

#set prompt dynamically so git branch is always correct
PROMPT_COMMAND="set_ps1"

function set_ps1(){
	if [ ! -z "$BASH_DOTFILES_IS_PRODUCTION" ]; then
		local user_color='31'
	else
		local user_color='32'
	fi

	local first_part="${debian_chroot:+($debian_chroot)}\[\033[01;${user_color}m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \[\033[00m\]"
	local git_branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"

	if [ ! -z "$git_branch" ]; then
		git_branch="($git_branch)";
	fi

	local last_part='\[\033[00m\]\$ '
	export PS1="$first_part$git_branch$VIRTUAL_ENV_PROMPT$last_part"
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

#nginx
alias nginx_check_config="nginx configtest"

alias sites_available="cd /etc/nginx/sites-available"

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

alias cpdir="pwd | xsel -ib"

#directories
alias pic="cddir ~/Pictures"

source "${SHARED_INCLUDES_DIR}sshfs.bash"

#mix for elixir
export PATH="/usr/local/bin:$PATH"

# for GPG signing for Git
# https://stackoverflow.com/questions/41052538/git-error-gpg-failed-to-sign-data
export GPG_TTY=$(tty)

alias services="service --status-all "