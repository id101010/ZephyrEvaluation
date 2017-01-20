#!/bin/bash

PROJPATH="$2" # path given by argument
BINARYPATH="$PROJPATH/outdir/nrf52_pca10040/zephyr.hex"

# Default files as base64
FILE_DEFAULT_SUBMAKE="b2JqLXkgKz0gbWFpbi5vCg=="

FILE_DEFAULT_MAKE="Qk9BUkQgPz0gbnJmNTJfcGNhMTAwNDAKQ09ORl9GSUxFID89IHByai5jb25mCgppbmNsdWRlICR7
WkVQSFlSX0JBU0V9L01ha2VmaWxlLmluYwo="

FILE_DEFAULT_PRJCONF="Q09ORklHX0FSTT15CkNPTkZJR19TT0NfRkFNSUxZX05SRjU9eQpDT05GSUdfU09DX1NFUklFU19O
UkY1Mlg9eQpDT05GSUdfQk9BUkRfTlJGNTJfUENBMTAwNDA9eQoKIyBlbmFibGUgdWFydCBkcml2
ZXIKI0NPTkZJR19TRVJJQUw9eQpDT05GSUdfVUFSVF9OUkY1PXkKCiMgZW5hYmxlIGNvbnNvbGUK
Q09ORklHX0NPTlNPTEU9eQpDT05GSUdfVUFSVF9DT05TT0xFPXkKCiMgYWRkaXRpb25hbCBib2Fy
ZCBvcHRpb25zCkNPTkZJR19HUElPX0FTX1BJTlJFU0VUPXkKCiMgYmx1ZXRvb3RoCkNPTkZJR19C
TFVFVE9PVEg9eQpDT05GSUdfQkxVRVRPT1RIX0NPTlRST0xMRVI9eQpDT05GSUdfQkxVRVRPT1RI
X0RFQlVHX0xPRz15CkNPTkZJR19CTFVFVE9PVEhfUEVSSVBIRVJBTD15CkNPTkZJR19CTFVFVE9P
VEhfR0FUVF9EWU5BTUlDX0RCPXkKCiMgcHJpbnRrIHN1cHBvcnQgZm9yIHNlcmlhbCBwcmludApD
T05GSUdfUFJJTlRLPXkKCiMgbnJmNTIgZ3BpbyBzdXBwb3J0CkNPTkZJR19HUElPPXkKCiMgZW5h
YmxlIHN1cHBvcnQgZm9yIERIVDExIE1vaXN0dXJlIFNlbnNvcgpESFRfQ0hJUF9ESFQxMT15Cg=="

FILE_DEFAULT_CPROG="LyoKICogQ29weXJpZ2h0IChjKSAyMDE2IEludGVsIENvcnBvcmF0aW9uCiAqCiAqIExpY2Vuc2Vk
IHVuZGVyIHRoZSBBcGFjaGUgTGljZW5zZSwgVmVyc2lvbiAyLjAgKHRoZSAiTGljZW5zZSIpOwog
KiB5b3UgbWF5IG5vdCB1c2UgdGhpcyBmaWxlIGV4Y2VwdCBpbiBjb21wbGlhbmNlIHdpdGggdGhl
IExpY2Vuc2UuCiAqIFlvdSBtYXkgb2J0YWluIGEgY29weSBvZiB0aGUgTGljZW5zZSBhdAogKgog
KiAgICAgaHR0cDovL3d3dy5hcGFjaGUub3JnL2xpY2Vuc2VzL0xJQ0VOU0UtMi4wCiAqCiAqIFVu
bGVzcyByZXF1aXJlZCBieSBhcHBsaWNhYmxlIGxhdyBvciBhZ3JlZWQgdG8gaW4gd3JpdGluZywg
c29mdHdhcmUKICogZGlzdHJpYnV0ZWQgdW5kZXIgdGhlIExpY2Vuc2UgaXMgZGlzdHJpYnV0ZWQg
b24gYW4gIkFTIElTIiBCQVNJUywKICogV0lUSE9VVCBXQVJSQU5USUVTIE9SIENPTkRJVElPTlMg
T0YgQU5ZIEtJTkQsIGVpdGhlciBleHByZXNzIG9yIGltcGxpZWQuCiAqIFNlZSB0aGUgTGljZW5z
ZSBmb3IgdGhlIHNwZWNpZmljIGxhbmd1YWdlIGdvdmVybmluZyBwZXJtaXNzaW9ucyBhbmQKICog
bGltaXRhdGlvbnMgdW5kZXIgdGhlIExpY2Vuc2UuCiAqLwoKI2luY2x1ZGUgPHplcGh5ci5oPgoj
aW5jbHVkZSA8bWlzYy9wcmludGsuaD4KI2luY2x1ZGUgPGJvYXJkLmg+CiNpbmNsdWRlIDxkZXZp
Y2UuaD4KI2luY2x1ZGUgPGdwaW8uaD4KCiNkZWZpbmUgREVCVUcKI2RlZmluZSBQT1JUICAgICAg
ICAiR1BJT18wIgoKI2RlZmluZSBMRUQxICAgICAgICAgMTcKI2RlZmluZSBMRUQyICAgICAgICAg
MTgKI2RlZmluZSBMRUQzICAgICAgICAgMTkKI2RlZmluZSBMRUQ0ICAgICAgICAgMjAKCiNkZWZp
bmUgU0xFRVBfVElNRSAgMTAwCgovLyBEZWJ1ZyB1c2luZyBzZXJpYWwgdGVybWluYWwKdm9pZCBk
ZWJ1Zyhjb25zdCBjaGFyICptZXNzYWdlKQp7CiNpZmRlZiBERUJVRwogICAgcHJpbnRrKCJbXGVb
MTszMW1ERUJVR1xlWzBtXSAlc1xuIiwgbWVzc2FnZSk7CiNlbmRpZgp9Cgp2b2lkIG1haW4odm9p
ZCkKewogICAgZGVidWcoIlN0YXJ0ZWQgcHJvZ3JhbS4iKTsKCiAgICBpbnQgY250ID0gMDsKICAg
IAogICAgLy8gQ29uZmlndXJlIGdwaW8KICAgIHN0cnVjdCBkZXZpY2UgKmRldjsKCiAgICBkZXYg
PSBkZXZpY2VfZ2V0X2JpbmRpbmcoUE9SVCk7CiAgICAKICAgIGdwaW9fcGluX2NvbmZpZ3VyZShk
ZXYsIExFRDEsIEdQSU9fRElSX09VVCk7CiAgICBncGlvX3Bpbl9jb25maWd1cmUoZGV2LCBMRUQy
LCBHUElPX0RJUl9PVVQpOwogICAgZ3Bpb19waW5fY29uZmlndXJlKGRldiwgTEVEMywgR1BJT19E
SVJfT1VUKTsKICAgIGdwaW9fcGluX2NvbmZpZ3VyZShkZXYsIExFRDQsIEdQSU9fRElSX09VVCk7
CgogICAgd2hpbGUgKDEpIHsKICAgICAgICBkZWJ1ZygiTWFpbiBjeWNsZS4iKTsKICAgICAgICBw
cmludGsoIkN5Y2xlOiAlZFxuIiwgY250KTsKCiAgICAgICAgZ3Bpb19waW5fd3JpdGUoZGV2LCBM
RUQxLCAoY250ICUgMikpOwogICAgICAgIGdwaW9fcGluX3dyaXRlKGRldiwgTEVEMiwgKGNudCAl
IDMpKTsKICAgICAgICBncGlvX3Bpbl93cml0ZShkZXYsIExFRDMsIChjbnQgJSA0KSk7CiAgICAg
ICAgZ3Bpb19waW5fd3JpdGUoZGV2LCBMRUQ0LCAoY250ICUgNSkpOwoKICAgICAgICBrX3NsZWVw
KFNMRUVQX1RJTUUpOwogICAgICAgIGNudCsrOwogICAgfQp9Cg=="

# Hack for declaration of tools on various systems
GDBSERV="$(which JLinkGDBServer)"
NRFJPRO="$(which nrfjprog)"

usage(){
cat << EOF
Usage: $0 [options]

This script handles the creation and compilation of zephyr applications for the nrf52dk.
Make sure the Zephyr environment (zephyr-env.sh) is sourced! Otherwise the compilation will not work.

OPTIONS:
   help                 Show this message
   debug                Initializes the JLinkGDBServer for the nrf52 board
   flash  ProjectPath   Flashes the previously built project
   build  ProjectPath   Builds a zephyr application
   create ProjectPath   Creates a new project folder with standard configuration
EOF
}

start_debugger(){
    JLinkGDBServer -Device nRF52832_xxAA -If SWD -Speed 4000 -Autoconnect 1
}

flash_nrf(){
    nrfjprog --eraseall -f nrf52
    nrfjprog --program $BINARYPATH -f nrf52
    nrfjprog --reset -f nrf52
}

build(){
    make -C $PROJPATH BOARD=nrf52_pca10040
}

create_new(){
    # Create project structure and default files
    mkdir -p $PROJPATH/src
    touch $PROJPATH/src/main.c
    touch $PROJPATH/src/Makefile
    touch $PROJPATH/Makefile
    touch $PROJPATH/prj.conf

    # Insert content into the default file
    echo "$(echo "$FILE_DEFAULT_MAKE"    | base64 -d)" >> $PROJPATH/Makefile
    echo "$(echo "$FILE_DEFAULT_PRJCONF" | base64 -d)" >> $PROJPATH/prj.conf
    echo "$(echo "$FILE_DEFAULT_SUBMAKE" | base64 -d)" >> $PROJPATH/src/Makefile
    echo "$(echo "$FILE_DEFAULT_CPROG"   | base64 -d)" >> $PROJPATH/src/main.c
}

setup(){
    echo "Not yet implemented. :("
    # TODO
    # download zephyr-sdk, extract to /opt
    # download nrfjtools, extract to /opt
    # download arm-none-eabi-tools, extract to /opt
    #
}

case $1 in    
    debug)
        start_debugger
        exit 0
    ;;
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
