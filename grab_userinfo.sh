#!/bin/bash

USER_DIR=/etc/passwd

red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'
NC='\033[0m' # No Color

SAVE_DIR=$1

echo "Script wordt uitgevoerd...."
sort -t " " -k 1 $USER_DIR | sort -t " " -k 1 | cut -d: -f 1,7  > $SAVE_DIR/.usershells.txt

if [ "$?" = "0" ]; then
  echo -e "${green}Succesvol uitgevoerd${NC}"
else
  echo -e "${red}Script mislukt${NC}"
  exit 1
fi

echo "done"

exit
