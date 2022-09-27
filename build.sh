#!/bin/bash
wget -nv http://musl.cc/x86_64-linux-musl-cross.tgz
tar xf x86_64-linux-musl-cross.tgz

export BASE_PATH=$(pwd)
export INSTALLPATH=$(pwd)/x86_64-linux-musl-cross/x86_64-linux-musl
export GCCVERSION=11.3.0
export TMPDIR=$(mktemp -d)
export CC=$(pwd)/x86_64-linux-musl-cross/bin/x86_64-linux-musl-gcc
export CXX=$(pwd)/x86_64-linux-musl-cross/bin/x86_64-linux-musl-g++
export AR=$(pwd)/x86_64-linux-musl-cross/bin/x86_64-linux-musl-ar
export AS=$(pwd)/x86_64-linux-musl-cross/bin/x86_64-linux-musl-as
export LD=$(pwd)/x86_64-linux-musl-cross/bin/x86_64-linux-musl-ld
export LDSHARED=$LD
export BUILDHOST=x86_64-linux-musl
deltmp() {
	#echo ${TMPDIR}
	rm -rf ${TMPDIR}
}

err() {
	echo "ERROR: $@"
	deltmp
	exit 1
}
for buildfile in $(pwd)/integrate/*.mk
do
	cd $TMPDIR
	make -f $buildfile prepare || err "PREPARE"
	make -f $buildfile build   || err "BUILD"
 	make -f $buildfile install || err "INSTALL"
	make -f $buildfile clean   || echo "WARNING: CLEAN"
done
deltmp

cd $BASE_PATH
tar -czf output.tgz x86_64-linux-musl-cross
