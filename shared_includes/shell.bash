#BUILT INS
alias a="ls -G -p"
alias aa="a -A"
alias aaa="aa -l -h"

function up() {
	if [[ "$#" -ne 1 ]] ; then
    	cd ../
    	a
    	return
	fi
	re='^[1-9][0-9]*$'
	if ! [[ $1 =~ $re ]] ; then
   		>&2 echo "usage: ${FUNCNAME[0]} <number_of_directories_up>"
    	return 1;
	fi
	for i in $(seq 1 $1); 
		do cd ../; 
	done
	a
}

#grep for pattern in files with extension
#http://stackoverflow.com/questions/12516937/grep-but-only-certain-file-extensions
# $1 pattern $2 - directory $3 file extension
function grepx() { grepc $1 $2 --include \*.$3;  }

#find files with extension in current directory
function findex() { find . -type f -name \*.$1; }
#find file by name recursively in current directory
alias findf="find . -name"