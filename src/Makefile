.SUFFIXES: .svg.m4 .svg

src != ./code_points.sh | sed -E -e "s/^(\S*):(\S*):(\S*)/\1_\2_\3.svg.m4/"
svg = $(src:.svg.m4=.svg)

%.svg.m4 : settings_DOUBLE.m4 settings_TRIPLE.m4
	m4 -D PREFIX=`echo "$@" | cut -d _ -f 1` -D LEVEL=`echo "$@" | cut -d _ -f 3` battery.m4 > $@
.INTERMEDIATE: %.svg.m4

%.svg : %.svg.m4
	m4 $< > $@

settings_DOUBLE.m4 settings_TRIPLE.m4:
	./settings.sh
.INTERMEDIATE: settings_DOUBLE.m4 settings_TRIPLE.m4

manifest.json: settings_DOUBLE.m4 settings_TRIPLE.m4
	m4 manifest.json.m4 > manifest.json

all: $(svg) manifest.json
.DEFAULT: all
.PHONY: all

clean:
	$(RM) settings_*.m4
	$(RM) *.svg
	$(RM) manifest.json
.PHONY: clean

