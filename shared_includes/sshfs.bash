#aliases for network drives
NETWORK_DRIVES_DIR="${HOME}/Network_Drives"
export NETWORK_DRIVES_DIR
alias netdrives="cddirls \"$NETWORK_DRIVES_DIR\""

alias mount_alaska="sshfs allen@10.0.1.22:/home/allen/ \"$NETWORK_DRIVES_DIR/alaska\"; netdrives alaska"

function sshfs_unmount(){
	#check number of arguments
	if [[ "$#" -ne 1 ]] ; then
    	>&2 echo "usage: ${FUNCNAME[0]} <directory_to_unmount>"
    	return 1;
	fi
	
	local target_directory="${NETWORK_DRIVES_DIR}/${1}"
	local current_directory=`pwd`
	local target_directory_regex="^${target_directory}"
	
	#if we are in the directory to be unmounted it will fail
	#cannot use double quotes in regex or it will do string match instead of regex match
	#https://stackoverflow.com/questions/19327220/bash-regex-matching-not-working
	if [[ "$current_directory" =~ $target_directory_regex ]] ; then
		cd ~
	fi

	fusermount -u "$target_directory"
}