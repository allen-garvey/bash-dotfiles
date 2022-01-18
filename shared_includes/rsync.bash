# syncs the contents of destination folder with contents
# of source folder
# arguments source_folder, destination_folder
# excludes hidden files
function rsync_dir() {
	if [[ -z $1 || -z $2 ]]; then
		>&2 echo "usage: ${FUNCNAME[0]} source_dir dest_dir"
		return 1;
	fi

	local source_dir=$1
	local dest_dir=$2

	#make sure the names of both directories end in slashes
	if ! [[ $source_dir =~ /$ ]]; then
		source_dir="$source_dir/"
	fi
	if ! [[ $dest_dir =~ /$ ]]; then
		dest_dir="$dest_dir/"
	fi
	
	time rsync --update --compress --recursive --itemize-changes --verbose --progress --exclude='*.o' --exclude='*.directory' --exclude='*.kra~' "$source_dir" "$dest_dir"
}

# syncs file
function rsync_file() {
	if [[ -z $1 || -z $2 ]]; then
		>&2 echo "usage: ${FUNCNAME[0]} source_filename dest_filename"
		return 1;
	fi

	local source_filename=$1
	local dest_filename=$2
	
	time rsync --update --compress --itemize-changes --verbose --progress "$source_filename" "$dest_filename"
}