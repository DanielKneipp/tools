#!/usr/bin/env bash

# sshfs daniel@ivsnserver:/home/daniel/ media/ivsnServer/
mount () {
    machine=$1
    machineDirecotory=$2
    localDirectory=$3
    #echo "`whoami`@$machine -> $machineDirecotory -> $localDirectory"
    sshfs "`whoami`@$machine:$machineDirecotory" "$localDirectory"
}

umount () {
    localDirectory=$1
    sudo umount "$localDirectory"
}

case $1 in
    '-m' )
        if [[ -z $2 || -z $3 || -z $4 ]]; then
            echo 'Usage: use_sshfs.sh -m <external machine> <external machine directory> <local directory>'
            exit
        fi
        mount $2 $3 $4
        ;;
    '-u' )
        if [[ -z $2 ]]; then
            echo 'Usage: use_sshfs.sh -u <local directory>'
            exit
        fi
        umount $2
        ;;
    * )
        echo 'Usage: use_sshfs.sh (-m | -u)'
        ;;
esac
