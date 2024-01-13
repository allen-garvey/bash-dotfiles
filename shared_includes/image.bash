function convert_batch_to_webp(){
    mkdir -p converted && find . -maxdepth 1 -type f  \( -name '*.tif' -o -name '*.png' -o -name '*.JPG' -o -name '*.jpg' -o -name '*.jpeg' \) | xargs -P 4 -I@  convert @ -quality 85 -set filename:name '%t' 'converted/%[filename:name].webp' && find . -maxdepth 1 -type f -name \*.webp -exec cp -p {} converted \;
}