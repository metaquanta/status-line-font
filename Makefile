
manifest.json: svg
	m4 manifest.json.m4 > manifest.json

svg:
	$(MAKE) -C svg
.PHONY: svg

all: manifest.json
	./scripts/generate.py manifest.json
.PHONY: all

clean:
	$(MAKE) -C svg clean
.PHONY: clean
