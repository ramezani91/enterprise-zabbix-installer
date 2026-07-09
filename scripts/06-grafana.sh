#!/bin/bash

########################################
# 06 - Grafana Installation
########################################


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"


source "$BASE_DIR/lib/common.sh"


install_grafana()
{

    if [ "$ENABLE_GRAFANA" != "true" ]; then
        log_warning "Grafana installation skipped"
        return
    fi


    log_info "Installing Grafana"


    apt install -y software-properties-common


    mkdir -p /etc/apt/keyrings


    wget -q -O - https://apt.grafana.com/gpg.key \
    | gpg --dearmor \
    -o /etc/apt/keyrings/grafana.gpg


    echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" \
    > /etc/apt/sources.list.d/grafana.list


    apt update -y


    apt install -y grafana


    systemctl enable grafana-server
    systemctl start grafana-server


    log_success "Grafana installed"

}


install_grafana
