#!/bin/bash

INTER_DIR=/proc/interrupts
DMA_DIR=/proc/dma
IOP_DIR=/proc/ioports
MEM_DIR=/proc/meminfo
UPTIME_DIR=/proc/uptime
VERS_DIR=/proc/version
SATA_DIR=/proc/scsi/scsi 

ARRAY=(
	$INTER_DIR
	$DMA_DIR
	$IOP_DIR
	$MEM_DIR
	$UPTIME_DIR
	$VERS_DIR
  $SATA_DIR
)
green='\033[0;32m'
SAVE_DIR=$1

echo "Proc statements worden uitgevoerd..."

touch $SAVE_DIR/.sysinfo.txt

for i in 1 2 3 4 5 6 7
do
  echo "" >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  echo ${ARRAY[$i-1]} " OUTPUT: " >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  cat ${ARRAY[$i-1]} >> $SAVE_DIR/.sysinfo.txt
done
echo "De proc data is uitgevoerd.."



echo "De terminal data wordt uitgevoerd.."

TOP='top -n 1 -b'
LSCPU='lscpu'
LSHW='lshw'
LSPCI='lspci'
LSUSB='lsusb'
LSBKL='lsblk'
DFH='df -H' 
FDISK='fdisk -l'
MOUNT='mount'
IFCONFIG='ifconfig'

# TOP
  echo "" >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  echo $TOP " OUTPUT: " >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  eval echo $TOP " Succesvol"
  $TOP >> $SAVE_DIR/.sysinfo.txt

# LSCPU
  echo "" >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  echo $LSCPU " OUTPUT: " >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  eval echo $LSCPU " Succesvol"
  $LSCPU >> $SAVE_DIR/.sysinfo.txt

# LSHW
  echo "" >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  echo $LSHW " OUTPUT: " >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  eval echo $LSHW " Succesvol"
  $LSHW >> $SAVE_DIR/.sysinfo.txt

# LSPCI
  echo "" >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  echo $LSPCI " OUTPUT: " >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  eval echo $LSPCI " Succesvol"
  $LSPCI >> $SAVE_DIR/.sysinfo.txt

# LSSCSI
  echo "" >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  echo $LSSCSI " OUTPUT: " >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  eval echo $LSSCSI " Succesvol"
  $LSSCSI >> $SAVE_DIR/.sysinfo.txt

# LSUSB
  echo "" >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  echo $LSUSB " OUTPUT: " >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  eval echo $LSUSB " Succesvol"
  $LSUSB >> $SAVE_DIR/.sysinfo.txt

# LSBKL
  echo "" >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  echo $LSBKL " OUTPUT: " >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  eval echo $LSBKL " Succesvol"
  $LSBKL >> $SAVE_DIR/.sysinfo.txt

# DFH
  echo "" >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  echo $DFH " OUTPUT: " >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  eval echo $DFH " Succesvol"
  $DFH >> $SAVE_DIR/.sysinfo.txt

# FDISK
  echo "" >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  echo $FDISK " OUTPUT: " >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  eval echo $FDISK " Succesvol"
  $FDISK >> $SAVE_DIR/.sysinfo.txt

# MOUNT
  echo "" >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  echo $MOUNT " OUTPUT: " >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  eval echo $MOUNT " Succesvol"
  $MOUNT >> $SAVE_DIR/.sysinfo.txt

# IFCONFIG
  echo "" >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  echo $IFCONFIG " OUTPUT: " >> $SAVE_DIR/.sysinfo.txt
  echo "-------------------------" >> $SAVE_DIR/.sysinfo.txt
  eval echo $IFCONFIG " Succesvol"
  $IFCONFIG >> $SAVE_DIR/.sysinfo.txt


echo "Terminal data afgerond"

if [ "$?" = "0" ]; then
  echo -e "${green}Succesvol uitgevoerd${NC}"
else
  echo -e "${red}Script mislukt${NC}"
  exit 1
fi

exit
