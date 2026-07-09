#!/bin/bash

########################################
# Enterprise Zabbix Logger
########################################


LOG_FILE="/tmp/enterprise-zabbix-installer.log"


init_logger()
{
    mkdir -p "$(dirname "$LOG_FILE")"

    touch "$LOG_FILE"
}


write_log()
{
    LEVEL=$1
    MESSAGE=$2

    TIME=$(date "+%Y-%m-%d %H:%M:%S")

    echo "$TIME [$LEVEL] $MESSAGE" >> "$LOG_FILE"
}


log_info()
{
    write_log "INFO" "$1"
    echo -e "\033[0;34m[INFO]\033[0m $1"
}


log_success()
{
    write_log "SUCCESS" "$1"
    echo -e "\033[0;32m[OK]\033[0m $1"
}


log_warning()
{
    write_log "WARNING" "$1"
    echo -e "\033[1;33m[WARN]\033[0m $1"
}


log_error()
{
    write_log "ERROR" "$1"
    echo -e "\033[0;31m[ERROR]\033[0m $1"
}
