LIBFFIVERSION=3.4.2
prepare:
	@echo "libffi preparing"
	@wget -nv https://github.com/libffi/libffi/releases/download/v${LIBFFIVERSION}/libffi-${LIBFFIVERSION}.tar.gz
	@tar xf libffi-${LIBFFIVERSION}.tar.gz

build:
	@echo "libffi building"
	@cd libffi-${LIBFFIVERSION} ;\
	./configure --prefix=/ ;\
	make -j$(shell nproc --all)

install:
	@echo "libffi installing"
	@cd libffi-${LIBFFIVERSION} ;\
	make DESTDIR=${INSTALLPATH} install

clean:
	@echo "libffi cleaning"
	@rm -rf libffi-${LIBFFIVERSION}{,.tar.gz}
