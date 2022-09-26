ZLIBVERSION=1.2.12
prepare:
	@echo "zlib preparing"
	@wget -nv https://zlib.net/zlib-${ZLIBVERSION}.tar.xz
	@tar xf zlib-${ZLIBVERSION}.tar.xz

build:
	@echo "zlib building"
	@cd zlib-${ZLIBVERSION} ;\
	./configure --prefix=/ ;\
	make CFLAGS=-fPIC SFLAGS=-fPIC -j$(shell nproc --all)

install:
	@echo "zlib installing"
	@cd zlib-${ZLIBVERSION} ;\
	make DESTDIR=${INSTALLPATH} install

clean:
	@echo "zlib cleaning"
	rm -rf zlib-${ZLIBVERSION}{,.tar.xz}

