#!/bin/bash

########################################
# Enterprise Zabbix Installation Lock
########################################


LOCK_DIR="/etc/enterprise-zabbix"
LOCK_FILE="$LOCK_DIR/.installed"



check_installation()
{

    if [ -f "$LOCK_FILE" ]; then

        log_warning "Enterprise Zabbix is already installed"
        return 1

    fi


    return 0

}



create_install_lock()
{

    mkdir -p "$LOCK_DIR"

    date > "$LOCK_FILE"


    log_success "Installation lock created"

}



remove_install_lock()
{

    rm -f "$LOCK_FILE"

    log_warning "Installation lock removed"

}
