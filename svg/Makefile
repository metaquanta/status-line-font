
.SUFFIXES: .svg.m4 .svg

src = $(wildcard *.svg.m4)
svg = $(src:.svg.m4=.svg)

%.svg : %.svg.m4
	m4 $< > $@

all: $(svg)
.PHONY: all

clean:
	rm *.svg
.PHONY: clean
