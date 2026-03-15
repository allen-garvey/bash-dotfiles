alias doc="cddir ~/Documents"
alias prog="cddirls ~/Documents/Programming"
alias desktop="cddir ~/Desktop"
alias downloads="cddir ~/Downloads"

alias dithermark="sites dithermark"
alias wgu="doc WGU && vcs"

alias minitaur_config="cd ~/Documents/Programming/Bash/minitaur-config && cat makefile"

alias umbrella_update_static="umbrella && npm run deploy && minitaur_config && make push-umbrella-static"

function masters(){
    local date_path=`date +"%Y/%m"`;
    cd "$HOME/Archive/Pictures/Mac-Photos-Library/Masters/${date_path}";
}

alias strange_scenery_images="cd ~/Archive/strange-scenery/images"
alias til="prog til && vcs"
alias notes="cd ~/Documents/notes-and-lists && vcs"
alias leetcode="prog leetcode && vcs"