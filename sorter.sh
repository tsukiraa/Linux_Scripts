#!/bin/bash
cd /home/$(whoami)/Downloads #Address directory
IFS=$'\n'
mkdir "|Pitcures" || echo "Debug: Pitcures folder exits"
mkdir "|Documents" || echo "Debug: Documents folder exits"
mkdir "|Videos" || echo "Debug: Videos folder exits"
mkdir "|Archives" || echo "Debug: Archives folder exits"
mkdir "|Others" || echo "Debug: Videos folder exits"
mkdir "|Folder" || echo "Debug: Folder folder exits"
documents=("pdf" "ocx" "txt" "otf" "html" "ptx" "otx" "lsx" "xls")
pictures=("jpg" "png" "ebp" "svg")
videos=("mp4" "mkv" "avi")
archives=("zip" "rar" ".7z" "iso" "img" ".gz")
for f in $(ls -F1) 
do
    if [[ " ${documents[*]} " =~ [[:space:]]${f:(-3)}[[:space:]] ]]; then
        echo document
    elif [[ " ${pictures[*]} " =~ [[:space:]]${f:(-3)}[[:space:]] ]]; then
        echo picture
    elif [[ " ${videos[*]} " =~ [[:space:]]${f:(-3)}[[:space:]] ]]; then
        echo video
    elif [[ " ${archives[*]} " =~ [[:space:]]${f:(-3)}[[:space:]] ]]; then
        echo archive
    elif [[ ${f:(-1)} == "/" ]]; then
        echo folder
    else
        echo no
    fi
done
