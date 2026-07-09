#!/bin/bash

########################################
# 01 - Repository Setup
########################################


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"


source "$BASE_DIR/lib/common.sh"


setup_repository()
{
    log_info "Starting repository setup"


    log_info "Downloading Zabbix repository package"


    cd /tmp


    wget -q https://repo.zabbix.com/zabbix/7.4/release/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest_7.4+ubuntu_all.deb


    dpkg -i zabbix-release_latest_7.4+ubuntu_all.deb


    apt update -y


    log_success "Zabbix repository configured"
}



setup_repository
