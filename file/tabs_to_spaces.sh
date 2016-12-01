#!/bin/bash
# data file
INPUT=$1

# IFS - The Internal Field Separator that is used for word
# splitting after expansion and to split lines into words
# with  the  read  builtin  command. The default value is
# ``<space><tab><newline>''
IFS=''

if [[ -e "out" ]]; then
    rm "out"
fi
 
# while loop
while read line
do
    newLine=""
    for (( i = 0; i < ${#line}; i++ )); do
        char=${line:i:1}
        if [[ "$char" == $'\t' ]]; then
            newLine="$newLine    "
        else
            newLine="$newLine$char"
        fi
    done
    echo "$newLine" >> "out"
done < "$INPUT"