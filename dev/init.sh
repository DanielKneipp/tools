#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ -z "$LD_LIBRARY_PATH" ]; then
    export LD_LIBRARY_PATH="$DIR"
else
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$DIR"
fi

$DIR/EXEC $1