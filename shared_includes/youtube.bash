function youtube_audio(){
	if [[ -z $1 ]]; then
		>&2 echo "usage: ${FUNCNAME[0]} youtube_url"
		return 1;
	fi

	youtube-dl --extract-audio --audio-format mp3 $1
}