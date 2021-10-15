#!/bin/bash -x

rm -rf FMS build

git clone https://github.com/NOAA-GFDL/FMS.git
mkdir build
cd build
autoreconf -i ../FMS/configure.ac
export FC=mpiifort
export CC=mpiicc
export CPPFLAGS="`nc-config --cflags` `nf-config --fflags`"
export LIBS="`nc-config --libs` `nf-config --flibs`"
../FMS/configure
make check 

