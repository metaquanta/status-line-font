define(`_WIDTH', 24)dnl
define(`_HEIGHT', 16)dnl
define(`_X0', 0)dnl
define(`_Y0', 2)dnl
define(`_XF', 22)dnl
define(`_YF', 14)dnl
define(`_TH', 1)dnl
define(`_FILL', `M`'eval(_X0`+2*'_TH) eval(_Y0`+2*'_TH) h`'_LEVEL V`'eval(_YF`-2*'_TH) H`'eval(_X0`+2*'_TH) z')dnl
define(`_BATTERY', `<svg width="_WIDTH" height="_HEIGHT" xmlns="http://www.w3.org/2000/svg">
    <path d="
M`'_X0 _Y0 H`'eval(_XF`-'_TH) V`'eval(_Y0`+2*'_TH) H`'_XF V`'eval(_YF`-2*'_TH) H`'eval(_XF`-'_TH) V`'_YF H`'_X0 z 
M`'eval(_X0`+'_TH) eval(_YF`-'_TH) H`'eval(_XF`-2*'_TH) V`'eval(_YF`-3*'_TH) H`'eval(_XF`-'_TH) V`'eval(_Y0`+3*'_TH) H`'eval(_XF`-2*'_TH) V`'eval(_Y0`+'_TH) H`'eval(_X0`+'_TH) z
_FILL
"/>
</svg>')dnl
