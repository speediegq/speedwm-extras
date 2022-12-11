# speedwm-extras // extra content for speedwm
# See LICENSE file for copyright and license details.

PREFIX = /usr
VERSION = 1.8

dist:
	mkdir -p speedwm-extras-${VERSION}
	cp -R Makefile LICENSE src README.md speedwm-extras-${VERSION}
	tar -cf speedwm-extras-${VERSION}.tar speedwm-extras-${VERSION}
	gzip speedwm-extras-${VERSION}.tar
	rm -rf speedwm-extras-${VERSION}
	rm -rf speedwm-extras-${VERSION}

install:
	mkdir -p ${DESTDIR}${PREFIX}/bin
	mkdir -p ${DESTDIR}${PREFIX}/share/speedwm
	cp -f src/speedwm* ${DESTDIR}${PREFIX}/bin ; chmod +x ${DESTDIR}${PREFIX}/bin/speedwm*
	echo ${VERSION} > ${DESTDIR}${PREFIX}/share/speedwm/speedwm-extras-version

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/speedwm
	rm -rf ${DESTDIR}${PREFIX}/share/speedwm

help:
	@echo -- speedwm-extras Makefile help --
	@echo
	@echo - Installation -
	@echo install: Installs speedwm-extras. You may need to run this as root.
	@echo uninstall: Uninstalls speedwm-extras. You may need to run this as root.
	@echo
	@echo - Releasing -
	@echo dist to create a tarball.

.PHONY: dist install uninstall help
