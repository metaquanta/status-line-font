.SUFFIXES: .svg.m4 .svg

src != ./code_points.sh | sed -E -e "s/^(\S*):(\S*):(\S*)/\1_\2_\3.svg.m4/"
svg = $(src:.svg.m4=.svg)

all: $(svg) manifest.json
.PHONY: all

%.svg.m4 : settings_DOUBLE.m4 settings_TRIPLE.m4 settings_VERTICAL.m4 glyph_template.sh battery.m4 vertical_battery.m4 code_points.sh
	./glyph_template.sh $@
.INTERMEDIATE: %.svg.m4

%.svg : %.svg.m4
	m4 $< > $@

settings_DOUBLE.m4 settings_TRIPLE.m4 settings_VERTICAL.m4:
	./settings.sh
.INTERMEDIATE: settings_DOUBLE.m4 settings_TRIPLE.m4

manifest.json: manifest.json.m4 code_points.sh
	m4 manifest.json.m4 > manifest.json

clean:
	$(RM) settings_*.m4
	$(RM) *.svg
	$(RM) *.svg.m4
	$(RM) manifest.json
.PHONY: clean

