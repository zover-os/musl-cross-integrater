prepare:
	@echo "libstdc++ preparing"
	@wget -nv -O gcc-${GCCVERSION}.tar.xz https://ftp.gnu.org/gnu/gcc/gcc-${GCCVERSION}/gcc-${GCCVERSION}.tar.xz
	@tar xf gcc-${GCCVERSION}.tar.xz
	@mkdir gcc-${GCCVERSION}/build

build:
	@echo "libstdc++ building"
	@cd gcc-${GCCVERSION}/build ;\
	../libstdc++-v3/configure --host=${BUILDHOST} --prefix=/ --disable-libstdcxx-pch --disable-multilib \
		--with-gxx-include-dir=${INSTALLPATH}/../lib/${BUILDHOST}/include/c++/12.2.0  ;\
	make -j$(shell nproc --all)

install:
	@echo "libstdc++ installing"
	@cd gcc-${GCCVERSION}/build ;\
	make DESTDIR=${INSTALLPATH} install

clean:
	@echo "libstdc++ cleanning"
	@rm -rf gcc-${GCCVERSION}{,.tar.xz}
