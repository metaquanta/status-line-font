
src:
	$(MAKE) -C src all
.PHONY: src

status-line-font.ttf status-line-font.eot status-line-font.woff status-line-font.woff2 status-line-font.svg:src
	./lib/generate.py ./src/manifest.json

all: status-line-font.ttf status-line-font.eot status-line-font.woff status-line-font.woff2 status-line-font.svg
.DEFAULT: all
.PHONY: all

clean:
	$(MAKE) -C src clean
	$(RM) *.ttf *.eot *.woff *.woff2 *.svg
.PHONY: clean
