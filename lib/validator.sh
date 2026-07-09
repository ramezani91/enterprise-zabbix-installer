#!/bin/bash

########################################
# Enterprise Zabbix Installer Validator
########################################


check_root()
{
    if [ "$EUID" -ne 0 ]; then
        echo "[ERROR] Please run as root"
        exit 1
    fi
}


check_os()
{
    if [ ! -f /etc/os-release ]; then
        echo "[ERROR] Cannot detect operating system"
        exit 1
    fi

    source /etc/os-release

    if [[ "$ID" != "ubuntu" ]]; then
        echo "[ERROR] Ubuntu required"
        exit 1
    fi
}


check_cpu()
{
    CPU=$(nproc)

    if [ "$CPU" -lt 2 ]; then
        echo "[WARNING] CPU less than recommended"
    fi
}


check_memory()
{
    RAM=$(free -g | awk '/Mem:/ {print $2}')

    if [ "$RAM" -lt 4 ]; then
        echo "[WARNING] RAM less than recommended (4GB)"
    fi
}


check_disk()
{
    SPACE=$(df / | awk 'NR==2 {print $4}')

    if [ "$SPACE" -lt 20000000 ]; then
        echo "[WARNING] Low disk space"
    fi
}


check_network()
{
    if ping -c 1 8.8.8.8 >/dev/null 2>&1
    then
        echo "[OK] Internet available"
    else
        echo "[WARNING] Internet unavailable"
    fi
}


run_validation()
{
    check_root
    check_os
    check_cpu
    check_memory
    check_disk
    check_network

    echo "[OK] System validation completed"
}
