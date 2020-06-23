#! /bin/shell

#======================================================================
# echo file name & File Extensions
#
# author: chenlong
# date: 2020-06-23
#======================================================================

FILE=$1
if [[ -z "$FILE" ]]; then
    FILE=test.sh
fi
echo "File Name:${FILE%.*}"
echo "File Extensions:${FILE#*.}"
