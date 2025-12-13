#!/bin/bash
cd /home/$(whoami)/Downloads #Address directory
IFS=$'\n'

mkdir -p "|Pitcures"
mkdir -p "|Documents"
mkdir -p "|Videos"
mkdir -p "|Archives"
mkdir -p "|Music" 
mkdir -p "|Others" 
mkdir -p "|Folder" 
documents=("pdf" "ocx" "txt" "otf" "html" "ptx" "otx" "lsx" "xls" "ltx" "csv")
pictures=("jpg" "png" "ebp" "svg" "peg")
videos=("mp4" "mkv" "avi")
music=("mp3" "wav")
archives=("zip" "rar" ".7z" "iso" "img" ".gz")

for f in $(ls -F1) 
do
    if [[ ${f:0:1} == "|" ]]; then
        continue
    fi
    if [[ " ${documents[*]} " =~ [[:space:]]${f:(-3)}[[:space:]] ]]; then
        mv $f "|Documents"
    elif [[ " ${pictures[*]} " =~ [[:space:]]${f:(-3)}[[:space:]] ]]; then
        mv $f "|Pitcures"
    elif [[ " ${videos[*]} " =~ [[:space:]]${f:(-3)}[[:space:]] ]]; then
        mv $f "|Videos"
    elif [[ " ${archives[*]} " =~ [[:space:]]${f:(-3)}[[:space:]] ]]; then
        mv $f "|Archives"
    elif [[ " ${music[*]} " =~ [[:space:]]${f:(-3)}[[:space:]] ]]; then
        mv $f "|Music"
    elif [[ ${f:(-1)} == "/" ]]; then
        mv $f "|Folder"
    else
        mv $f "|Others"
    fi
done
