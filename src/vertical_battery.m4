include(`settings_VERTICAL.m4')dnl
define(`_BX', eval(`('_XF`-'_X0`-'_BUTTON_W`)/2 +'_X0)) 
define(`_FILL', `M`'eval(_XF`-'_TH) eval(_YF`-'_TH) H`'eval(_X0`+'_TH) v`'eval(LEVEL`*-1') H`'eval(_XF`-'_TH) z')dnl
define(`_BATTERY', `<svg width="_WIDTH" height="_HEIGHT" xmlns="http://www.w3.org/2000/svg">
    <path d="
M`'_X0 eval(_Y0`+1') H`'_BX V`'_Y0 h`'_BUTTON_W v`'1 H`'_XF V`'_YF H`'_X0 z 
M`'eval(_XF`-'_TH) eval(_Y0`+2*'_TH) H`'eval(_X0`+'_TH) V`'eval(_YF`-'_TH) H`'eval(_XF`-1') z
_FILL
"/>
</svg>')dnl
_BATTERY`'
