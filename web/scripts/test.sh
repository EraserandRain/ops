#!/bin/bash
export LC_ALL=C
str=$(cat READ.md)
if [ $str = 1 ]
    then echo a
elif [ $str = 2 ]
    then echo b
else
    echo unrecognized
fi