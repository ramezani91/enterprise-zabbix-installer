#!/bin/bash

########################################
# Enterprise Zabbix Installer
########################################


BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


source "$BASE_DIR/lib/common.sh"

DRY_RUN=false


if [ "$1" == "--dry-run" ]; then

    DRY_RUN=true

fi

init_logger

VERSION=$(cat "$BASE_DIR/VERSION")

print_banner

log_info "Starting Enterprise Zabbix Installation"


if [ "$DRY_RUN" = true ]; then

    log_warning "Dry run mode enabled"
    log_warning "System validation skipped"

else

    run_validation

fi


run_module()
{

MODULE=$1


    if [ "$DRY_RUN" = true ]; then

        log_warning "DRY RUN: Skipping execution of $MODULE"
        return

    fi


    log_info "Running module: $MODULE"


    bash "$BASE_DIR/scripts/$MODULE"


    if [ $? -ne 0 ]
    then
        log_error "Module failed: $MODULE"
        exit 1
    fi


    log_success "Module completed: $MODULE"
}

MODULES=(

"00-system.sh"

"01-repository.sh"

"02-database.sh"

"03-zabbix.sh"

"04-web.sh"

"05-agent.sh"

"06-grafana.sh"

"99-final-check.sh"

)



for MODULE in "${MODULES[@]}"
do

    run_module "$MODULE"

done



log_success "Enterprise Zabbix Installation Finished"
