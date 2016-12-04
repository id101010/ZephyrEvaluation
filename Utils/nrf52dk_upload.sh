#!/bin/bash

FLASH_TOOL="nrfjprog"
BOARD="nrf52_pca10040"
FAMILY="nrf52"

PROJ_PATH="$1"
BINARY_PATH="$PROJ_PATH/outdir/$BOARD/zephyr.hex"

# Build binary
make -C $PROJ_PATH #BOARD=$BOARD

# Reset board and upload hex file
$FLASH_TOOL --eraseall -f $FAMILY
$FLASH_TOOL --program $BINARY_PATH -f $FAMILY
$FLASH_TOOL --reset -f $FAMILY
