#!/bin/bash

cd `dirname $0`
. ../settings

function codepoints {
    _BATTERY_CODEPOINT_START="${1}_BATTERY_CODEPOINT_START"
    _BATTERY_WIDTH="${1}_BATTERY_WIDTH"
    _BATTERY_BUTTON_DEPTH="${1}_BATTERY_BUTTON_DEPTH"
    CODEPOINT=${!_BATTERY_CODEPOINT_START}
    # TODO: accomodate higher button depths
    LEVELS=$(( ${!_BATTERY_WIDTH} - 1 ))

    n=$(( $LEVELS - 4 )) # _TH * 2, _TH^-1 * 2

    for i in $( seq 0 $n ) 
    do
        echo "${1}:$(( $CODEPOINT + $i )):$i"
    done
}

codepoints DOUBLE
codepoints TRIPLE
