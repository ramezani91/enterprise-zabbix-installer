#!/bin/bash

########################################
# Enterprise Zabbix Installer Config
########################################


# Project
export PROJECT_NAME="enterprise-zabbix-installer"
export VERSION_FILE="./VERSION"


# Zabbix
export ZABBIX_VERSION="7.4"


# Operating System
export OS_REQUIRED="Ubuntu"


# Database
export DB_TYPE="PostgreSQL"
export DB_NAME="zabbix"
export DB_USER="zabbix"


# Services
export ZABBIX_SERVER_SERVICE="zabbix-server"
export ZABBIX_AGENT_SERVICE="zabbix-agent2"
export GRAFANA_SERVICE="grafana-server"
export NGINX_SERVICE="nginx"


# Ports
export ZABBIX_WEB_PORT="80"
export ZABBIX_SERVER_PORT="10051"
export POSTGRES_PORT="5432"
export GRAFANA_PORT="3000"


# Paths
export INSTALL_DIR="/opt/enterprise-zabbix"
export LOG_DIR="/var/log/enterprise-zabbix"
export BACKUP_DIR="/var/backups/enterprise-zabbix"


# Network
export AUTO_DETECT_IP="true"


# Default Settings
export ENABLE_GRAFANA="true"
export ENABLE_AGENT="true"
export ENABLE_BACKUP="true"


# Colors
export CONFIG_LOADED="true"
