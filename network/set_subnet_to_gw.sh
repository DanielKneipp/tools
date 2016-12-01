#!/usr/bin/env bash

#sudo route add -net 192.168.0.0/24 gw 192.168.0.9

case $1 in
    '-a' )
        if [[ -z $2 || -z $3 ]]; then
            echo 'Usage: set_subnet_to_gw.sh -a <subnet> <gateway>'
            exit
        fi
        sudo route add -net $1/24 gw $2
        ;;
    '-d' )
        if [[ -z $2 || -z $3 ]]; then
            echo 'Usage: set_subnet_to_gw.sh -d <subnet> <gateway>'
            exit
        fi
        sudo route del -net $1/24 gw $2
        ;;
    * )
        echo 'Usage: set_subnet_to_gw.sh (-a | -d) <subnet> <gateway>'
        ;;
esac