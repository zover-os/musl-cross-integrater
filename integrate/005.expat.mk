EXPATVERSION=2.4.9
prepare:
	@echo "expat preparing"
	@wget -nv https://prdownloads.sourceforge.net/expat/expat-${EXPATVERSION}.tar.xz
	@tar xf expat-${EXPATVERSION}.tar.xz

build:
	@echo "expat building"
	@cd expat-${EXPATVERSION} ;\
	./configure --prefix=/ --disable-static ;\
	make -j$(shell nproc --all)

install:
	@echo "expat installing"
	@cd expat-${EXPATVERSION} ;\
	make DESTDIR=${INSTALLPATH} install

clean:
	@echo "expat cleaning"
	@rm -rf expat-${EXPATVERSION}{,.tar.xz}
