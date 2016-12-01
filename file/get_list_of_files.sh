#!/bin/bash

if [[ $1 =~ .*\/$ ]]; then
    path="$1"
else
    path="$1/"
fi

files=$(ls -l $1 | awk '{print $9}')
for file in $files; do
    echo "$path$file"
done