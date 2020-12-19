#!/bin/bash

. ../settings

function battery_settings {
    _BATTERY_WIDTH="${1}_BATTERY_WIDTH"
    W=$(( (${!_BATTERY_WIDTH} / 8) * 8 + 8 ))
    _BATTERY_HEIGHT="${1}_BATTERY_HEIGHT"
    Y0=$(( (16 - ${!_BATTERY_HEIGHT}) / 2 ))
    _BATTERY_HEIGHT="${1}_BATTERY_HEIGHT"
    YF=$(( $Y0 + ${!_BATTERY_HEIGHT} ))
    _BATTERY_CODEPOINT_START="${1}_BATTERY_CODEPOINT_START"
    _BATTERY_BUTTON_WIDTH="${1}_BATTERY_BUTTON_WIDTH"
    _BATTERY_BUTTON_DEPTH="${1}_BATTERY_BUTTON_DEPTH"

    cat > settings_${1}.m4 << EOF

define(\`_CODEPOINT', ${!_BATTERY_CODEPOINT_START})
define(\`_WIDTH', $W)dnl
define(\`_HEIGHT', 16)dnl
define(\`_X0', 0)dnl
define(\`_Y0', $Y0)dnl
define(\`_XF', ${!_BATTERY_WIDTH})dnl
define(\`_YF', $YF)dnl
define(\`_TH', 1)dnl
define(\`_BUTTON_W', ${!_BATTERY_BUTTON_WIDTH})dnl
define(\`_BUTTON_D', ${!_BATTERY_BUTTON_DEPTH})dnl

EOF

}

battery_settings VERTICAL

battery_settings DOUBLE

battery_settings TRIPLE
