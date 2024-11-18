#!/bin/bash

# Copyright (C) KolibriOS-NG team 2024. All rights reserved
# Distributed under terms of the GNU General Public License

source ../../scripts/start-recipe

BUILD()
{
    i586-kolibrios-gcc -c crt-stub.c -o crt-stub.o
    i586-kolibrios-ar crs libc.a crt-stub.o
}

INSTALL()
{
    mkdir -p "$SDK_SYSROOT_DIR/lib"
    cp -f kos-app.lds "$SDK_SYSROOT_DIR/lib/"
    cp -f libc.a "$SDK_SYSROOT_DIR/lib"
}

CLEAN()
{
    rm -f crt-stub.o libc.a
}

source ../../scripts/end-recipe
