function generate_music_video(){
	#check number of arguments
	if [[ "$#" -ne 3 ]] ; then
    	>&2 echo "usage: ${FUNCNAME[0]} <video_name> <image_file> <audio_file>"
    	return 1;
	fi

    local video_name="$1"
    local image_file="$2"
    local audio_file="$3"

    # get audio length in seconds
    local audio_length=$(soxi -D "$audio_file");
    # round down audio length and add 1 second
    local audio_length=$(awk "BEGIN { printf(\"%.0f\n\", ${audio_length}-0.5+1); }")
	
    time ffmpeg -r 1 -loop 1 -i "$image_file" -i "$audio_file" -acodec aac -b:a 256k -vcodec libx264 -r 1 -t "$audio_length" "${video_name}.mp4"
}
