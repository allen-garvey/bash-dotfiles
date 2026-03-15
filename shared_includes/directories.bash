#Directories
#generic change directory function
function cddir() { cd "$1"; cd "./$2"; }
#change directory and list contents
function cddirls() { cddir "$1" "$2"; a; }

alias home="cddirls ~ "

#alias to cd into directory in sites dir
alias sites="cddir ~/Sites"

alias etc="cddirls /etc"