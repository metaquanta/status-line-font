include(`settings_VERTICAL.m4')dnl
define(`_BX', eval(`('_XF`-'_X0`-'_BUTTON_W`)/2 +'_X0)) 
define(`_FILL', `M`'eval(_XF`-1') eval(_YF`-1') H`'eval(_X0`+1') v`'eval(LEVEL`*-1') H`'eval(_XF`-1') z')dnl
define(`_BATTERY', `<svg width="_WIDTH" height="_HEIGHT" xmlns="http://www.w3.org/2000/svg">
    <path d="
M`'_X0 eval(_Y0`+1') H`'_BX V`'_Y0 h`'_BUTTON_W v`'1 H`'_XF V`'_YF H`'_X0 z 
ifelse(eval(_YF`-'_Y0`-2'), LEVEL, `', 
`M`'eval(_XF`-1') eval(_Y0`+2') H`'eval(_X0`+1') V`'eval(_YF`-1-'LEVEL) H`'eval(_XF`-1') z'
)
"/>
</svg>')dnl
_BATTERY`'
