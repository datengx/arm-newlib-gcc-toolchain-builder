#!/bin/bash

set -e

. ./environ.sh
if [[ "$TARGET" == ""  || "$PREFIX_REAL" == "" ]] ; then
	echo "You need to set: TARGET and PREFIX_REAL"; exit 0;
fi

setup_builddir gdb

(cd "$tool_builddir" && \
    ../gdb_sources/configure \
    -v \
    --quiet \
    --prefix="$PREFIX_REAL" \
    --target="$TARGET" \
    --enable-interwork \
    --enable-multilib \
    --with-gnu-ld \
    --with-gnu-as \
    --disable-werror )

quieten_make

run_make all install
