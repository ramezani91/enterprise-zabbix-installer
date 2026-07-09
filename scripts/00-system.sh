#!/bin/bash

########################################
# 00 - System Preparation
########################################


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"


source "$BASE_DIR/lib/common.sh"


system_prepare()
{
    log_info "Starting system preparation"

if ! command_exists apt; then
    log_error "APT package manager not found"
    return 1
fi


    log_info "Updating package repository"

    apt update -y || return 1


    log_info "Installing base packages"

    apt install -y \
    curl \
    wget \
    vim \
    net-tools \
    gnupg \
    ca-certificates \
    lsb-release \
    unzip \
    jq || return 1    

    log_info "Creating directories"


    create_directory "$INSTALL_DIR"
    create_directory "$LOG_DIR"
    create_directory "$BACKUP_DIR"


    log_info "Configuring timezone"

    timedatectl set-timezone Asia/Tehran


    log_success "System preparation completed"
    return 0
}



