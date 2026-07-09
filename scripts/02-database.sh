#!/bin/bash

########################################
# 02 - PostgreSQL Database Setup
########################################


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"


source "$BASE_DIR/lib/common.sh"


install_database()
{

    log_info "Installing PostgreSQL"


    apt install -y postgresql postgresql-contrib


    systemctl enable postgresql
    systemctl start postgresql


    log_info "Creating Zabbix database user"


    sudo -u postgres psql <<EOF

CREATE USER $DB_USER WITH PASSWORD 'zabbix';

CREATE DATABASE $DB_NAME
OWNER $DB_USER;

GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;

EOF


    log_success "PostgreSQL database prepared"

}



install_database
