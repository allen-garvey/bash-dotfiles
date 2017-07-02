function daemon_start(){
	#check number of arguments
	if [[ "$#" -ne 2 ]] ; then
    	>&2 echo "usage: ${FUNCNAME[0]} <command> <pid_filename>"
    	return 1;
	fi
	"$1" & echo $! > "$2"
}

#can stop process with `pkill -F $pid_filename`