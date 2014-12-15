#!/bin/bash

INTER_DIR=/proc/interrupts
DMA_DIR=/proc/dma
IOP_DIR=/proc/ioports
MEM_DIR=/proc/meminfo
UPTIME_DIR=/proc/uptime
VERS_DIR=/proc/version

ARRAY=(
	$INTER_DIR
	$DMA_DIR
	$IOP_DIR
	$MEM_DIR
	$UPTIME_DIR
	$VERS_DIR
)

SAVE_DIR=$1

echo "Script wordt uitgevoerd..."

touch $SAVE_DIR/.sysinfo.txt

for i in 1 2 3 4 5 6
do
  echo "" >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  echo ${ARRAY[$i-1]} " OUTPUT: " >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  cat ${ARRAY[$i-1]} >> $SAVE_DIR/.sysinfo.txt
done

echo "done"

exit
