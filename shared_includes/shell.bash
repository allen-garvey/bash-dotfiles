#BUILT INS
alias a="ls -G"
alias aa="a -a"
alias aaa="aa -l"

alias up="cd ../;a"

#grep for pattern in files with extension
#http://stackoverflow.com/questions/12516937/grep-but-only-certain-file-extensions
# $1 pattern $2 - directory $3 file extension
function grepx() { grepc $1 $2 --include \*.$3;  }

#find files with extension in current directory
function findex() { find . -type f -name \*.$1; }
#find file by name recursively in current directory
alias findf="find . -name"

#combine the contents of all files in directory matching extension into one merged file
#$1 is input directory; $2 is full path of output file; $3 is file extension matching files in input directory
function mergef(){ 
	#check the output file doesn't already exist, since it would be overwritten
	if [ -f $2 ]; then
		(>&2 echo "Merge files aborting: output file $2 already exists")
		kill -INT $$
	fi
	find $1 -name \*.$3 -print0 | xargs -0 -I file cat file > $2 
}

#alias to sync directories
alias synced="rsync -a -p -u -v -v"