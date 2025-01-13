SHELL := /bin/bash
MOD_NAME := advanced-robots
MOD_VERSION := $(shell cat info.json | jq -r .version)
ARCHIVE_NAME := $(MOD_NAME)_$(MOD_VERSION)

.PHONY: setup
setup:
	aqua i

.PHONY: clean
clean:
	rm -rf bin

.PHONY: format
format:
	stylua ./

.PHONY: files
files:
	@comm -23 <(git ls-files | sort) <(cat package.ignore | sort)

.PHONY: package
package: clean format
	mkdir -p bin/$(ARCHIVE_NAME)
	rsync -v --files-from=<(make files) . bin/$(ARCHIVE_NAME)
	cd bin; zip -r $(ARCHIVE_NAME).zip $(ARCHIVE_NAME)
	@echo
	zipinfo bin/$(ARCHIVE_NAME).zip

.PHONY: install
install: package
	cp bin/$(ARCHIVE_NAME).zip $${HOME}'/Library/Application Support/factorio/mods'/$(ARCHIVE_NAME).zip
