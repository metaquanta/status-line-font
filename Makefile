
src:
	$(MAKE) -C src all
.PHONY: src

fonts: src
	./lib/generate.py ./src/manifest.json
.PHONY: fonts

all: fonts
.PHONY: all

clean:
	$(MAKE) -C src clean
	$(RM) *.ttf *.eot *.woff *.woff2 *.svg
.PHONY: clean
