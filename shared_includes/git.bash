#Shared includes for git

#function to create git repository and default .gitignore
function git_setup() { 
	local git_setup_dir="${DOTFILES_DIR}git/";
	local current_year=$(date -u "+%Y");
	
	git init;
	cat "${git_setup_dir}default.gitignore" >> .gitignore;
	sed "s/@CURRENT_YEAR/$current_year/" "${git_setup_dir}default_license.txt" >> license.txt; 
	cat "${git_setup_dir}default_readme.md" >> README.md;
}

#alias to add all to git and check
alias ga="git add .; git status;"

alias gm="git commit -m"

alias gp="git push"

alias gu="git pull"

#show diff between staged files and HEAD
#hide whitespace differences flag from little things i like to do with git
#https://csswizardry.com/2017/05/little-things-i-like-to-do-with-git/
alias gd="git diff --cached -w --word-diff"

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