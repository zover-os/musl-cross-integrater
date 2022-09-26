LIBXMLVERSION=2.10
prepare:
	@echo "libxml preparing"
	@wget -nv https://download.gnome.org/sources/libxml2/${LIBXMLVERSION}/libxml2-${LIBXMLVERSION}.0.tar.xz
	@tar xf libxml2-${LIBXMLVERSION}.0.tar.xz

build:
	@echo "libxml building"
	@cd libxml2-${LIBXMLVERSION}.0 ;\
	./configure --prefix=/ --sysconfdir=/etc --disable-static --without-python ;\
	make -j$(shell nproc --all)

install:
	@echo "libxml installing"
	@cd libxml2-${LIBXMLVERSION}.0 ;\
	make DESTDIR=${INSTALLPATH} install

clean:
	@echo "libxml cleaning"
	rm -rf libxml2-${LIBXMLVERSION}.0{,.tar.xz}

