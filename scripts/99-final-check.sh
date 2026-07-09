#!/bin/bash

########################################
# 99 - Final Health Check
########################################


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"


source "$BASE_DIR/lib/common.sh"


service_check()
{
    SERVICE=$1

    if systemctl is-active --quiet "$SERVICE"
    then
        log_success "$SERVICE is running"
    else
        log_error "$SERVICE is not running"
    fi
}


final_check()
{

    log_info "Starting final system check"


    echo ""
    echo "================================"
    echo " Server Information"
    echo "================================"

    echo "Hostname: $(hostname)"
    echo "IP: $(get_primary_ip)"
    echo ""


    echo "================================"
    echo " Services"
    echo "================================"


    service_check zabbix-server
    service_check zabbix-agent2
    service_check nginx
    service_check grafana-server
    service_check postgresql


    echo ""

    log_success "Health check completed"

}


final_check
