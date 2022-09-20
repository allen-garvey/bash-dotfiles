function generate_music_video(){
	#check number of arguments
	if [[ "$#" -ne 1 ]] ; then
    	>&2 echo "usage: ${FUNCNAME[0]} <image_file>"
    	return 1;
	fi

    local image_file="$1"
    local audio_file=$(basename -- "$(find . -name '*.wav')")
    local video_name="${audio_file%.*}"

	echo "time ffmpeg -loop 1 -i \"$image_file\" -i \"$audio_file\" -c:v libx264 -tune stillimage -c:a aac -b:a 256k -pix_fmt yuv420p -shortest \"${video_name}.mp4\""

    time ffmpeg -loop 1 -i "$image_file" -i "$audio_file" -c:v libx264 -tune stillimage -c:a aac -b:a 256k -pix_fmt yuv420p -shortest "${video_name}.mp4"
}