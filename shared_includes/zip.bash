#aliases for zipping files and directories

#zip a directory
function zip_dir(){
	if [[ -z $1 ]]; then
		>&2 echo "usage: ${FUNCNAME[0]} source_dir"
		return 1;
	fi
	#based on: https://stackoverflow.com/questions/1848415/remove-slash-from-the-end-of-a-variable
	zip_filename="${1%/}.zip"

	if [[ -e $zip_filename ]]; then
		>&2 echo "$zip_filename already exists"
		return 1;
	fi
	zip -r "$zip_filename" "$1"
}