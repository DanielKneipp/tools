#!/bin/bash

if [[ -z $1 || -z $2 || -z $3 ]]; then
    echo "Usage: mount_dev.sh <fale-system-type> <device-label> <path>"
else
    fs_type=$1
    dev_label=$2
    path_to_mount=$3

    uid=$(id -u)

    sudo mount -t $fs_type -o uid=$uid,gid=$uid,umask=022 -L $dev_label $path_to_mount
fi
