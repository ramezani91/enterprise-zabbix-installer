#!/bin/bash

# Terminal Colors

export RED="\033[0;31m"
export GREEN="\033[0;32m"
export YELLOW="\033[1;33m"
export BLUE="\033[0;34m"
export CYAN="\033[0;36m"
export WHITE="\033[1;37m"
export NC="\033[0m"


info()
{
    echo -e "${BLUE}[INFO]${NC} $1"
}


success()
{
    echo -e "${GREEN}[OK]${NC} $1"
}


warning()
{
    echo -e "${YELLOW}[WARN]${NC} $1"
}


error()
{
    echo -e "${RED}[ERROR]${NC} $1"
}
