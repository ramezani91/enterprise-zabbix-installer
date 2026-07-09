#!/bin/bash

########################################
# Enterprise Zabbix Common Loader
########################################


BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

export BASE_DIR


source "$BASE_DIR/lib/colors.sh"
source "$BASE_DIR/lib/logger.sh"
source "$BASE_DIR/lib/config.sh"
source "$BASE_DIR/lib/utils.sh"
source "$BASE_DIR/lib/validator.sh"
source "$BASE_DIR/lib/lock.sh"
source "$BASE_DIR/lib/credentials.sh"

info "Enterprise Zabbix libraries loaded"
