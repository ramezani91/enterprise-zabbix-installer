#!/bin/bash

########################################
# 04 - Web Interface Setup
########################################


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"


source "$BASE_DIR/lib/common.sh"


configure_web()
{

    log_info "Configuring Zabbix Web Interface"


    apt install -y nginx php-fpm php-pgsql php-gd php-xml php-bcmath php-mbstring


    systemctl enable nginx
    systemctl restart nginx


    systemctl restart php*-fpm


    log_success "Web interface configured"

}


configure_web
