#!/bin/bash
# searches for files not in a folder and places them in one based of command line argument. Then for each file it compresses it and moves into new folder 
#bash 241_script.sh clean 
count=$(ls -1 | wc -l)

if [ "$count" -gt 0 ]; then
    echo "$count"
    if [ -n "$1" ]; then
        mkdir "$1"
        mv *.* "$1"
        cd "$1"
        for var in * ;do
            zip "$var.zip" "$var"
        done
        mkdir compressed
        mv *.zip compressed
    else
        mkdir storage
        mv *.* storage
        cd storage
        for var in * ;do
            zip "$var.zip" "$var"
        done
        mkdir compressed
        mv *.zip compressed
    fi
fi
