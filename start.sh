#!/bin/bash

red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'
white='\033[1;37m'
yellow='\033[1;33m'
NC='\033[0m' # No Color

SAVE_DIR=/home
TAR_DIR=/home
LOOP_VAR=true

ROOT_UID=0
E_NOTROOT=87

#zorg dat het script alleen als root uitgevoerd wordt
if [ "$UID" -ne "$ROOT_UID" ]; then
  echo "Run this script as root"
  exit $E_NOTROOT
fi

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
echo -e "${yellow}note: please configure paths.${white}"
echo ""
printf "> "
read USER_CHOICE
}
choices() {
if [ "$USER_CHOICE" = "1" ]; then
  clear
  banner
  echo -e "${yellow}Collector view${white}"
  echo ""
  echo -e "Choose a script: \n"
  echo "1) Grab user info"
  echo "2) Grab system info"
  echo "3) Grab logfiles"
  echo "4) Back to main menu"
  echo ""
  printf "> "
  read USER_IN2
  if [ "$USER_IN2" = "1" ]; then
    bash scripts/grab_userinfo.sh $SAVE_DIR
  elif [ "$USER_IN2" = "2" ]; then
    bash scripts/grab_sysinfo.sh $SAVE_DIR
  elif [ "$USER_IN2" = "3" ]; then
    bash scripts/grab_logfiles.sh $SAVE_DIR $TAR_DIR/logs.tar
  elif [ "$USER_IN2" = "4" ]; then
    echo ""
  fi
  echo "press enter to go back to the main menu"
  read HALT
elif [ "$USER_CHOICE" = "2" ]; then
  clear
  banner
  echo -e "${yellow}Configuring paths${white}"
  echo ""
  echo -e "Enter save path (e.g:/var/www):\n"
  printf "> "
  read SAVE_DIR
  echo -e "Enter tar path:(e.g:/var/www):\n"
  printf "> "
  read TAR_DIR
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
