include(`settings_'PREFIX`.m4')dnl
define(`_BY0', eval(_Y0`+('_YF`-'_Y0`-'_BUTTON_W`)/2'))dnl
define(`_BYF', eval(_BY0`+'_BUTTON_W))dnl
define(`_BX0', eval(_XF`-'_BUTTON_D))dnl
define(`_FILL', `M`'eval(_X0`+2*'_TH) eval(_Y0`+2*'_TH) h'LEVEL` V`'eval(_YF`-2*'_TH) H`'eval(_X0`+2*'_TH) z')dnl
define(`_BATTERY', `<svg width="_WIDTH" height="_HEIGHT" xmlns="http://www.w3.org/2000/svg">
    <path d="
M`'_X0 _Y0 H`'eval(_XF`-'_TH) V`'_BY0 H`'_XF V`'_BYF H`'eval(_XF`-'_TH) V`'_YF H`'_X0 z 
M`'eval(_X0`+'_TH) eval(_YF`-'_TH) H`'eval(_XF`-2*'_TH) V`'eval(_BYF`-'_TH) H`'_BX0 V`'eval(_BY0`+'_TH) H`'eval(_XF`-2*'_TH) V`'eval(_Y0`+'_TH) H`'eval(_X0`+'_TH) z
ifelse(`0',LEVEL,`',_FILL)
"/>
</svg>')dnl
_BATTERY`'
