#!/usr/bin/env bash

mkEth0 () {
    sudo ifconfig eth0:$1 $2
}

delEth0 () {
    sudo ifconfig eth0:$1 down
}

shopt -s extglob # To accept kind of regex in case statement
case $1 in
    '-d' )
        if [[ -z $2 ]]; then
            echo 'usage: mk_eth -d <number-of-eth0> '
            exit 1
        fi
        delEth0 $2
        ;;

    +([0-9]) )
        if [[ -z $1 || -z $2 ]]; then
            echo 'usage: mk_eth <number-of-eth0> <ip>'
            exit 1
        fi
        mkEth0 $1 $2
        ;;
        
    * )
        echo 'usage: mk_eth (\d | -d)'
        ;;
esac
