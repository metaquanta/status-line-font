include(`svg/parameters.m4')
define(`_GLYPH', 
`    "battery-`'$1": {
      "codepoint": eval($1`+''_CODEPOINT`),
      "source": "svg/battery-$1.svg"
    }')

define(
  `_GLYPHS',
  `esyscmd(
    `ls svg/*svg | sed -e "s/^svg\/battery-\(\S*\)\.svg/_GLYPH(\1)/" | tr "\n" " " | sed -e "s/) _/), _/g" '
  )'
)

{
  "glyphs": {
_GLYPHS
  },
  "options": {
    "autowidth": true,
    "copyright": "metaquanta",
    "font_ascent": 14,
    "font_descent": 2,
    "font_design_size": 16,
    "font_em": 16,
    "font_name": "batteries",
    "no_hash": true,
    "output": {
      "fonts": "batteries"
    }
  }
}
