
manifest.json: svg
	m4 manifest.json.m4 > manifest.json

svg:
	$(MAKE) -C svg clean
	$(MAKE) -C svg
.PHONY: svg

battery: battery.m4 manifest.json
	./scripts/generate.py manifest.json
.PHONY: battery

battery.m4:
	cp ./battery.m4 ./svg/parameters.m4
.PHONY: battery.m4

battery_wide: battery_wide.m4 manifest.json
	./scripts/generate.py manifest.json
.PHONY: battery_wide

battery_wide.m4:
	cp battery_wide.m4 ./svg/parameters.m4
.PHONY: battery_wide.m4

clean:
	$(MAKE) -C svg clean
	$(RM) manifest.json
	$(RM) ./svg/parameters.m4
.PHONY: clean

.DEFAULT: battery_wide
