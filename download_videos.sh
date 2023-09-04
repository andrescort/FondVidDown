#!/bin/bash

install_yt ()
{
    sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O $PREFIX/bin/yt-dlp
    chmod a+rx $PREFIX/bin/yt-dlp
}

download_videos ()
{
    while IFS= read -r linea; do
    yt-dlp $linea
    # echo $linea
    done < "$urls_file"
}

urls_file="fondant_videos/urls_file"
install_yt
download_videos
