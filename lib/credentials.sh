#!/bin/bash

########################################
# Enterprise Zabbix Credentials Manager
########################################


CREDENTIAL_DIR="/etc/enterprise-zabbix"
CREDENTIAL_FILE="$CREDENTIAL_DIR/credentials.conf"



generate_password()
{
    openssl rand -base64 18
}



create_credentials()
{

    mkdir -p "$CREDENTIAL_DIR"


    if [ -f "$CREDENTIAL_FILE" ]; then

        log_warning "Credentials already exist"
        return

    fi


    DB_PASSWORD=$(generate_password)


    cat > "$CREDENTIAL_FILE" <<EOF
DB_USER=zabbix
DB_NAME=zabbix
DB_PASSWORD=$DB_PASSWORD
EOF


    chmod 600 "$CREDENTIAL_FILE"


    log_success "Database credentials generated"

}



load_credentials()
{

    if [ -f "$CREDENTIAL_FILE" ]; then

        source "$CREDENTIAL_FILE"

    else

        log_error "Credential file not found"
        exit 1

    fi

}
