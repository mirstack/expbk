PROJECT=ansup
VERSION=0.2.0
MACHINE=$(shell uname -sp | tr '[A-Z]' '[a-z]' | sed -e 's/\s/-/')

-include config.mk

all:
	@echo Nothing to do...

install:
	@echo TODO...

install-man: install man
	install -d $(PREFIX)/man
	install -m 0644 man/*.1.roff $(PREFIX)/share/man/man1/

version:
	sed -i 's/^VERSION=.*$$/VERSION="$(VERSION)"/' bin/ansup

pack:
	@echo TODO...

man:
ifdef RONN
	$(RONN) --manual="Mir's $(PROJECT) manual" --organization='Mir' man/*.ronn
else
	@echo Package providing 'ronn' is not installed. Skipping man page docs.
endif

test:
	$(BASH) ./test/test.sh

.PHONY: all deps install test version pack man
