#Shared includes for git

#function to create git repository and default .gitignore
function git_setup() { 
	local git_setup_dir="${DOTFILES_DIR}git/";
	
	git init; 
	cat "${git_setup_dir}default.gitignore" >> .gitignore; 
	cat "${git_setup_dir}default_license.txt" >> license.txt; 
	cat "${git_setup_dir}default_readme.md" >> README.md; 
}

#alias to add all to git and check
alias ga="git add .; git status;"

alias gm="git commit -m"

alias gp="git push"

alias gu="git pull"

#show diff between staged files and HEAD
alias gd="git diff --cached"

alias gts="git status"

#function to copy git repo and gitignore
function git_copy() { cp -r "./.git" "$1/.git"; cp "./.gitignore" "$1/.gitignore"; }

#alias to discard all uncommited changes
alias git_discard="git checkout -- ."

#clone github repo using ssh
#because github will only give https links if you are not signed in
#argument should be github repo https url
function github_ssh() {
	if [[ "$#" -ne 1 ]] ; then
    	echo "usage: github_ssh https://github.com/username/repo-name.git";
    	return 1;
	fi
	https_url="$1";
	ssh_url="git@github.com:${https_url//https:\/\/github\.com\//}";
	echo -e "executing: git clone $ssh_url\n";
	git clone "$ssh_url"
}