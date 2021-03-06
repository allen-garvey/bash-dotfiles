function makedir(){
	if [[ "$#" -ne 1 ]] ; then
    	>&2 echo "usage: ${FUNCNAME[0]} <directory to create>"
    	return 1;
	fi
	if [[ -e $1 ]] ; then
    	>&2 echo "$1 already exists"
    	return 1;
	fi
	mkdir -p $1;
	cd $1;
	pwd;
}

#disk size, get disk size of given directory
function ds(){
	if [[ "$#" -ne 1 ]] ; then
    	>&2 echo "usage: ${FUNCNAME[0]} <directory_to_get_disk_size_of>"
    	return 1;
	fi
	du -hs $1
}