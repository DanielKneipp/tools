#!/usr/bin/env bash

# ----- Config ----- #

DEST_DIR="grid_imgs"

# ------ Code ------ #

print_help () {
    echo "Usage: grid_image.sh <img> <grid-size (e.g.: 4x4)>" 
}

if [ "$#" -ne 2 ]; then
    print_help
    exit
fi

IMG=$1
GRID_SIZE=$2

ORI_DIR=`pwd`
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
IMG_DIR=$(dirname "${IMG}")

cd $IMG_DIR

mkdir -p $DEST_DIR

FILENAME=$(basename "${IMG}")
EXT="${FILENAME##*.}"
FILENAME_NO_EXT="${FILENAME%.*}"

convert $FILENAME -crop $GRID_SIZE@ +repage +adjoin ${DEST_DIR}/${FILENAME_NO_EXT}_${GRID_SIZE}@_%d.${EXT}

cd $ORI_DIR
