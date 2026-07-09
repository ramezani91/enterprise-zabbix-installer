#!/usr/bin/env bash

# ==============================================================================
# Enterprise Zabbix Installer
# File: lib/logger.sh
# Description: Logging library
# ==============================================================================

set -Eeuo pipefail

# ---------- Colors ----------

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# ---------- Log Directory ----------

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

LOG_DIR="${PROJECT_ROOT}/logs"

mkdir -p "${LOG_DIR}"

LOG_FILE="${LOG_DIR}/installer.log"

touch "${LOG_FILE}"

# ---------- Timestamp ----------

timestamp() {

date +"%Y-%m-%d %H:%M:%S"

}

# ---------- Logger ----------

_write_log() {

local LEVEL="$1"

local MESSAGE="$2"

echo "$(timestamp) [$LEVEL] ${MESSAGE}" >> "${LOG_FILE}"

}

log_info() {

echo -e "${BLUE}[INFO]${NC} $1"

_write_log INFO "$1"

}

log_success() {

echo -e "${GREEN}[ OK ]${NC} $1"

_write_log SUCCESS "$1"

}

log_warn() {

echo -e "${YELLOW}[WARN]${NC} $1"

_write_log WARNING "$1"

}

log_error() {

echo -e "${RED}[FAIL]${NC} $1"

_write_log ERROR "$1"

}

log_title() {

echo

echo "==================================================="

echo "$1"

echo "==================================================="

echo

_write_log TITLE "$1"

}