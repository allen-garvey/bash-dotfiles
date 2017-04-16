function makedir(){
	if [[ "$#" -ne 1 ]] ; then
    	>&2 echo "usage: ${FUNCNAME[0]} <directory to create>"
    	return 1;
	fi
	if [[ -d $1 ]]  || [[ -f $1 ]] ; then
    	>&2 echo "$1 already exists"
    	return 1;
	fi
	mkdir -p $1;
	cd $1;
}