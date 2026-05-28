alias doc="cddir ~/Documents"
alias prog="cddirls ~/Documents/Programming"
alias desktop="cddir ~/Desktop"
alias downloads="cddir ~/Downloads"

function open_dev(){
    timeout 2s git pull
    vcs
}

alias dithermark="sites dithermark"
alias wgu="doc WGU && open_dev"

alias minitaur_config="cd ~/Documents/Programming/Bash/minitaur-config && cat makefile"

alias umbrella_update_static="umbrella && npm run deploy && minitaur_config && make push-umbrella-static"

function masters(){
    local date_path=`date +"%Y/%m"`;
    cd "$HOME/Archive/Pictures/Mac-Photos-Library/Masters/${date_path}";
}

alias strange_scenery_images="cd ~/Archive/strange-scenery/images"
alias til="prog til && open_dev"
alias notes="doc notes-and-lists && open_dev"
alias leetcode="prog leetcode && open_dev"