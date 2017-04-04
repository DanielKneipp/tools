#!/usr/bin/env bash

# ----- Config ----- #

GRID_IMG_EXEC="./grid_image.sh"

# ------ Code ------ #

print_help () {
    echo "Usage: grid_folder <folder-pth> <file-extension> <grid-size (e.g.: 4x4)>"    
}

if [ "$#" -ne 3 ]; then
    print_help
    exit
fi

PTH=$1
EXT=$2
GRID_SIZE=$3

if [ "$PTH" != "/" ]; then
    PTH="${PTH%*/}"
fi
EXT="${EXT#.*}"

shopt -s nullglob
for f in "$PTH"/*.$EXT; do
    $GRID_IMG_EXEC $f $GRID_SIZE
done

