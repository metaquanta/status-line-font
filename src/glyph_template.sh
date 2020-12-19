#!/bin/bash
PREFIX=$( echo "$1" | cut -d _ -f 1 )
LEVEL=$( echo "$1" | cut -d _ -f 3 | cut -d . -f 1 )

if [ $PREFIX == "VERTICAL" ]; then
    m4 -D LEVEL=$LEVEL vertical_battery.m4 > $1
else
    m4 -D PREFIX=$PREFIX -D LEVEL=$LEVEL battery.m4 > $1
fi
