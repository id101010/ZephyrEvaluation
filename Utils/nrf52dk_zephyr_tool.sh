#!/bin/bash

PROJPATH="$2" # path given by argument
BINARYPATH="$PROJPATH/outdir/nrf52_pca10040/zephyr.hex"
DEFAULT_MAKE="BOARD ?= nrf52_pca10040\nCONF_FILE ?= prj.conf\ninclude /opt/zephyr-project/Makefile.inc"
DEFAULT_PRJ="CONFIG_SOC_FAMILY_NRF5=y\nCONFIG_SOC_SERIES_NRF52X=y\nCONFIG_BOARD_NRF52_PCA10040=y\n# enable uart driver\n#CONFIG_SERIAL=y\nCONFIG_UART_NRF5=y\n# enable console\nCONFIG_CONSOLE=y\nCONFIG_UART_CONSOLE=y\n# additional board options\nCONFIG_GPIO_AS_PINRESET=y\n# bluetooth\nCONFIG_BLUETOOTH=y\nCONFIG_BLUETOOTH_CONTROLLER=y\n# printk support for serial print\nCONFIG_PRINTK=y\n# nrf52 gpio support\nCONFIG_GPIO=y\n# enable support for DHT11 Moisture Sensor\nDHT_CHIP_DHT11=y\n"

usage()
{
cat << EOF
Usage: $0 [options]

This script handles the creation and compilation of zephyr applications for the nrf52dk.

OPTIONS:
   help                 Show this message
   flash  ProjectPath   Flashes the previously built project
   build  ProjectPath   Builds a zephyr application
   create ProjectPath   Creates a new project folder with standard configuration
EOF
}

flash_nrf()
{
    nrfjprog --eraseall -f nrf52
    nrfjprog --program $BINARYPATH -f nrf52
    nrfjprog --reset -f nrf52
}

build()
{
    make -C $PROJPATH BOARD=nrf52_pca10040
}

create_new()
{
    mkdir -p $PROJPATH/src
    touch $PROJPATH/Makefile
    touch $PROJPATH/prj.conf

    # Insert Makefile default
    echo -e "$DEFAULT_MAKE" >> $PROJPATH/Makefile

    # Insert prj.conf default for nrf52dk
    echo -e "$DEFAULT_PRJ" >> $PROJPATH/prj.conf
}

case $1 in
    flash)
        flash_nrf
        exit 0
    ;;
    build)
        build
        exit 0
    ;;
    create)
        create_new
        exit 0
    ;;
    help)
        usage
        exit 0
    ;;
    *)
        echo "[ERROR] Unknown parameters"
        usage
        exit 1
    ;;
esac
