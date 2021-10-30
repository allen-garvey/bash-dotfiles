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

alias gu="git pull"

function gum() {
	git show-branch main 2> /dev/null;
	if [ $? -eq 0 ]; then
        git checkout main;
    else
    	git checkout master;
    fi
    
    if [ $? -eq 0 ]; then
        git pull;
    fi
}

function gumr() {
	local current_branch_name="$(git rev-parse --abbrev-ref HEAD)"
	gum
	git checkout "$current_branch_name"
}

alias gts="git status"

alias gitl="git log"

#function to copy git repo and gitignore
function git_copy() { 
	if [[ -z $1 ]]; then
		>&2 echo "usage: ${FUNCNAME[0]} destination_directory"
		return 1;
	fi

	cp -r "./.git" "$1/.git"; 
	cp "./.gitignore" "$1/.gitignore"; 
}

#show diff between staged files and HEAD
#hide whitespace differences flag from little things i like to do with git
#https://csswizardry.com/2017/05/little-things-i-like-to-do-with-git/
alias git_diff="git diff --cached -w --word-diff"

#alias to discard all uncommited changes
alias git_discard="git checkout -- ."

# revert previous commit
# and move changes to staging
function git_revert(){
	git reset --soft HEAD^;
	git status;
}

#branching aliases
alias gg="git show-branch;"

function gitc() { git checkout -b $1; }

alias gitc-="git checkout -"

#pushes current branch
function gp(){
	local current_branch_name="$(git rev-parse --abbrev-ref HEAD)"
	if [[ -z "$current_branch_name" ]]; then
		>&2 echo "You do not appear to be currently in a git branch"
		return 1;
	fi

	local git_push_remote="${1:-origin}"

	echo "git push $git_push_remote $current_branch_name"
	git push "$git_push_remote" "$current_branch_name"
}