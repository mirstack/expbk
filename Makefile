-include ./config.make

mirup_root=$(prefix)/lib/mirup

all:
	-@echo ok...

install:
	install -d $(prefix)/bin
	install bin/mir* -m 0755 -t $(prefix)/bin
	sed -i 's~%#MIRUP_ROOT%~MIRUP_ROOT=$(mirup_root)~' $(prefix)/bin/mir*
	install -d -m 0755 $(mirup_root)
	install up.yml local -m 0644 -t $(mirup_root)
