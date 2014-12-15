#!/bin/bash

red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'
white='\033[1;37m'
yellow='\033[1;33m'
NC='\033[0m' # No Color

SAVE_DIR=/home
LOOP_VAR=true

banner(){
  echo -e "${red} ____           _   _   _   _                           _            "
  echo "|  _ \__      _| \ | | | | | | __ _ _ ____   _____  ___| |_ ___ _ __ "
  echo "| |_) \ \ /\ / /  \| | | |_| |/ _\` | '__\ \ / / _ \/ __| __/ _ \ '__|"
  echo "|  __/ \ V  V /| |\  | |  _  | (_| | |   \ V /  __/\__ \ ||  __/ |   "
  echo -e "|_|     \_/\_/ |_| \_| |_| |_|\__,_|_|    \_/ \___||___/\__\___|_|   ${NC}"
}
menu() {
echo -e "${yellow}A linux data gathering tool."
echo ""
echo -e "${white}Select an option:\n"
echo "1) Start collecting"
echo "2) Configure paths"
echo "3) Cleanup"
echo "4) exit"
echo ""
echo -e "${yellow}note: please configure paths, default paths are current directory.${white}"
echo ""
printf "> "
read USER_CHOICE
}
choices() {
if [ "$USER_CHOICE" = "1" ]; then
  clear
  banner
  echo -e "${yellow}Collector view${white}"
  echo "Starting collector..."
  sh grab_userinfo.sh $SAVE_DIR
  sh grab_sysinfo.sh $SAVE_DIR
  echo "press enter to go back to the main menu"
  read HALT
elif [ "$USER_CHOICE" = "2" ]; then
  clear
  banner
  echo -e "${yellow}Configuring paths${white}"
  echo "Enter save path:"
  read SAVE_DIR
  printf "> "
elif [ "$USER_CHOICE" = "3" ]; then
  echo "Cleaning up your mess"
elif [ "$USER_CHOICE" = "4" ]; then
  echo "Exit.."
  LOOP_VAR=false
fi
}
while $LOOP_VAR; do
  banner
  menu
  choices
  clear
done
exit
