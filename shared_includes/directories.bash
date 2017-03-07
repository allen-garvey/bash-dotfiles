#Directories
#generic change directory function
function cddir() { cd "$1"; cd "./$2"; }
#change directory and list contents
function cddirls() { cddir "$1" "$2"; a; }

alias home="cddirls ~ "

#alias to cd into directory in sites dir
alias sites="cddir ~/Sites"

#alias to cd into directory in programming dir
alias doc="cddir ~/Documents"

#alias to cd into directory in programming dir
alias prog="cddirls ~/Documents/Programming"

#alias to cd into directory in desktop
alias desktop="cddir ~/Desktop"

alias downloads="cddir ~/Downloads"

alias etc="cddirls /etc"

alias osu="cddirls ~/Documents/OSU"