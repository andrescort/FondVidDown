#!/bin/bash


install_yt ()
{
    wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O $PREFIX/bin/yt-dlp
    chmod a+rx $PREFIX/bin/yt-dlp
}

download_videos ()
{
    while IFS= read -r linea; do
    yt-dlp -P storage/downloads $linea
    # echo $linea
    done < "$urls_file"
}

if [[ -d $HOME/storage/downloads ]]
then
    urls_file="FondVidDown/urls_file"
    install_yt
    download_videos
else
    echo "Ejecuta:"
    echo
    echo "termux-setup-storage"
    echo
    echo
    echo "Y luego aceptar"
fi

