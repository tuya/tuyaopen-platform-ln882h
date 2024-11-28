#!/usr/bin/sh
# $1 - example name: echo_app_top
# $2 - example version: 1.0.0
# $3 - header files directory:
# $4 - libs directory:
# $5 - libs: tuyaos tuyaapp
# $6 - output directory:

print_not_null()
{
    if [ x"$1" = x"" ]; then
        return 1
    fi

    echo "$1"
}


set -e
cd `dirname $0`

EXAMPLE_NAME=$1         # the example name selected when ./configure
EXAMPLE_VER=$2          # the version, default is 1.0.0
HEADER_DIR=$3           # the include file directory, default is build/include
LIBS_DIR=$4             # the libraries file directory, default is build/lib
LIBS=$5                 # the libraries file, default is libtuyaapp & libtuyaos
OUTPUT_DIR=$6           # the output file directory, default is build/bin
USER_CMD=$7             # the user compile command

TOP_DIR=$(pwd)

if [ "$USER_CMD" = "build" ]; then
    USER_CMD=all
fi

make APP_BIN_NAME=$EXAMPLE_NAME APP_VERSION=$EXAMPLE_VER LIBS_DIR=$LIBS_DIR LIBS="$LIBS" OUTPUT_DIR=$OUTPUT_DIR HEADER_DIR="$HEADER_DIR" $USER_CMD -C ln882h_os

APP_BIN_NAME=$EXAMPLE_NAME
APP_VERSION=$EXAMPLE_VER
APP_BIN_DIR=${OUTPUT_DIR}

mkdir -p ${APP_BIN_DIR}
BIN_DIR=${TOP_DIR}/ln882h_os/output

cp ${BIN_DIR}/${APP_BIN_NAME}_UG_${APP_VERSION}.bin  ${APP_BIN_DIR}/${APP_BIN_NAME}_UG_${APP_VERSION}.bin
cp ${BIN_DIR}/${APP_BIN_NAME}_UA_${APP_VERSION}.bin  ${APP_BIN_DIR}/${APP_BIN_NAME}_UA_${APP_VERSION}.bin
cp ${BIN_DIR}/${APP_BIN_NAME}_QIO_${APP_VERSION}.bin ${APP_BIN_DIR}/${APP_BIN_NAME}_QIO_${APP_VERSION}.bin
cp ${BIN_DIR}/${APP_BIN_NAME}_${APP_VERSION}.asm  ${APP_BIN_DIR}/${APP_BIN_NAME}_${APP_VERSION}.asm
cp ${BIN_DIR}/${APP_BIN_NAME}_${APP_VERSION}.elf  ${APP_BIN_DIR}/${APP_BIN_NAME}_${APP_VERSION}.elf
cp ${BIN_DIR}/${APP_BIN_NAME}_${APP_VERSION}.map ${APP_BIN_DIR}/${APP_BIN_NAME}_${APP_VERSION}.map
