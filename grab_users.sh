#!/bin/bash

USER_DIR=/etc/passwd

echo "Waar wil je het bestand opslaan"

read SAVE_DIR
echo "Script wordt uitgevoerd...."
sort -t " " -k 1 $USER_DIR | sort -t " " -k 1 | cut -d: -f 1,7  > $SAVE_DIR/.usershells.txt

echo "done"

exit
