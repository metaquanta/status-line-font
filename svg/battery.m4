define(`_WIDTH', 24)
define(`_HEIGHT', 16)
define(`_X0', 0)
define(`_Y0', 2)
define(`_XF', 22)
define(`_YF', 14)
define(`_TH', 1)
define(`_FILL', `M`'eval(_X0`+2*'_TH) eval(_Y0`+2*'_TH) h`'_LEVEL V`'eval(_YF`-2*'_TH) H`'eval(_X0`+2*'_TH) z')
define(`_BATTERY', `<svg width="_WIDTH" height="_HEIGHT" xmlns="http://www.w3.org/2000/svg">
    <path d="
M`'_X0 _Y0 H`'eval(_XF`-'_TH) V`'eval(_Y0`+2*'_TH) H`'_XF V`'eval(_YF`-2*'_TH) H`'eval(_XF`-'_TH) V`'_YF H`'_X0 z 
M`'eval(_X0`+'_TH) eval(_YF`-'_TH) H`'eval(_XF`-2*'_TH) V`'eval(_YF`-3*'_TH) H`'eval(_XF`-'_TH) V`'eval(_Y0`+3*'_TH) H`'eval(_XF`-2*'_TH) V`'eval(_Y0`+'_TH) H`'eval(_X0`+'_TH) z
_FILL
"/>
</svg>')
