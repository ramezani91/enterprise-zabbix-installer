#!/bin/bash

########################################
# 03 - Zabbix Server Installation
########################################


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"


source "$BASE_DIR/lib/common.sh"


install_zabbix()
{

    log_info "Installing Zabbix Server packages"


    apt install -y \
    zabbix-server-pgsql \
    zabbix-frontend-php \
    zabbix-nginx-conf \
    zabbix-sql-scripts \
    zabbix-agent2


    log_info "Importing Zabbix database schema"


    zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz \
    | sudo -u $DB_USER psql $DB_NAME


    log_info "Configuring Zabbix server"


    backup_file /etc/zabbix/zabbix_server.conf


    sed -i "s/^# DBPassword=.*/DBPassword=zabbix/" \
    /etc/zabbix/zabbix_server.conf


    systemctl restart zabbix-server
    systemctl enable zabbix-server


    systemctl restart zabbix-agent2
    systemctl enable zabbix-agent2


    log_success "Zabbix installation completed"

}


install_zabbix
