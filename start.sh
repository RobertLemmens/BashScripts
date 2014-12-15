#!/bin/bash
SAVE_DIR=$1

red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'
white='\033[1;37m'
yellow='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${red} ____           _   _   _   _                           _            "
echo "|  _ \__      _| \ | | | | | | __ _ _ ____   _____  ___| |_ ___ _ __ "
echo "| |_) \ \ /\ / /  \| | | |_| |/ _\` | '__\ \ / / _ \/ __| __/ _ \ '__|"
echo "|  __/ \ V  V /| |\  | |  _  | (_| | |   \ V /  __/\__ \ ||  __/ |   "
echo -e "|_|     \_/\_/ |_| \_| |_| |_|\__,_|_|    \_/ \___||___/\__\___|_|   ${NC}"

echo -e "${yellow}A linux data gathering tool."
echo ""
echo -e "${white}Select an option:\n"
echo "1) Start collecting"
echo "2) Configure paths"
echo "3) Cleanup"
echo ""
echo -e "${yellow}note: please configure paths, default paths are current directory."

exit
