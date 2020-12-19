
src:
	$(MAKE) -C src all
.PHONY: src

fonts: src
	./lib/generate.py ./src/manifest.json
.PHONY: fonts

status-line-font.txt: src
	./src/code_points.sh | sed -E -e 's/.*:(.*):.*/\1/' | xargs -ICP ./src/to_glyph.sh CP > status-line-font.txt

all: fonts status-line-font.txt
.PHONY: all

clean:
	$(MAKE) -C src clean
	$(RM) *.ttf *.eot *.woff *.woff2 *.svg
.PHONY: clean
