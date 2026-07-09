#!/bin/bash

########################################
# 05 - Zabbix Agent2 Configuration
########################################


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"


source "$BASE_DIR/lib/common.sh"


configure_agent()
{

    log_info "Configuring Zabbix Agent2"


    apt install -y zabbix-agent2


    backup_file /etc/zabbix/zabbix_agent2.conf


    sed -i "s/^Server=.*/Server=127.0.0.1/" \
    /etc/zabbix/zabbix_agent2.conf


    sed -i "s/^Hostname=.*/Hostname=$(hostname)/" \
    /etc/zabbix/zabbix_agent2.conf


    systemctl enable zabbix-agent2
    systemctl restart zabbix-agent2


    log_success "Zabbix Agent2 configured"

}


configure_agent
