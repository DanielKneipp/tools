#!/bin/bash

libs=$(ldd ./$1 | awk '{print $3}')

for lib in $libs; do
    if [[ $lib != "" && -e $lib ]]; then
        `cp $lib ./`
    fi
done