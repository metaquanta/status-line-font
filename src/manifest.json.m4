define(`_GLYPH', 
`    "$1": {
      "codepoint": esyscmd(`echo $1 | cut -d _ -f 2'),
      "source": "src/$1.svg"
    }')

define(
  `_GLYPHS',
  `esyscmd(
    `./code_points.sh | tr : _ | sed -e "s/^\(.*\)/_GLYPH(\1)/" | tr "\n" " " | sed "s/) _/),\n_/g"'
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
    "font_name": "status-line-font",
    "no_hash": true,
    "output": {
      "fonts": ""
    }
  }
}
