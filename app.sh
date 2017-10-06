#!/bin/bash
echo "Params: $1."
if [[ -z $1 ]]; then
  loc=.
  echo "no dir specified, using <.>"
else
  loc=$1
fi
cmake -DCMAKE_TOOLCHAIN_FILE=/app/Toolchain-mingw32.cmake -DBUILD_SHARED_LIBS=OFF -DCMAKE_EXE_LINKER_FLAGS="-static-libgcc -static-libstdc++ -static" -G"Unix Makefiles" $loc && make

