#!/bin/bash

########################################
# Enterprise Zabbix Installer Utilities
########################################


get_primary_ip()
{
    ip route get 8.8.8.8 | awk '{print $7; exit}'
}


command_exists()
{
    command -v "$1" >/dev/null 2>&1
}


create_directory()
{
    DIR=$1

    if [ ! -d "$DIR" ]; then
        mkdir -p "$DIR"
    fi
}


backup_file()
{
    FILE=$1

    if [ -f "$FILE" ]; then
        cp "$FILE" "$FILE.backup.$(date +%Y%m%d_%H%M%S)"
    fi
}


print_banner()
{
    echo ""
    echo "========================================"
    echo " Enterprise Zabbix Installer"
    echo " Automated Deployment Framework"

    if [ -n "$VERSION" ]; then
        echo " Version: $VERSION"
    fi

    echo "========================================"
    echo ""
}


run_command()
{
    CMD=$1

    echo "[RUN] $CMD"

    eval "$CMD"

    if [ $? -ne 0 ]; then
        echo "[ERROR] Command failed"
        return 1
    fi
}
