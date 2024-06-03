function convert_batch_to_webp(){
    mkdir -p converted && find . -maxdepth 1 -type f  \( -name '*.tif' -o -name '*.png' -o -name '*.JPG' -o -name '*.jpg' -o -name '*.jpeg' \) | xargs -P 4 -I@  convert @ -quality 85 -set filename:name '%t' 'converted/%[filename:name].webp' && find . -maxdepth 1 -type f -name \*.webp -exec cp -p {} converted \;
}

function convert_batch_to_webp_lossless(){
    mkdir -p converted && find . -maxdepth 1 -type f  \( -name '*.tif' -o -name '*.png' -o -name '*.JPG' -o -name '*.jpg' -o -name '*.jpeg' \) | xargs -P 4 -I@  convert @ -define webp:lossless=true -set filename:name '%t' 'converted/%[filename:name].webp' && find . -maxdepth 1 -type f -name \*.webp -exec cp -p {} converted \;
}

function convert_batch_to_jpg(){
    mkdir -p converted && find . -maxdepth 1 -type f -name \*.webp | xargs -P 4 -I@  convert @ -quality 90 -set filename:name '%t' 'converted/%[filename:name].jpg';
}