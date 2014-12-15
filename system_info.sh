#!/bin/bash


FDISK='fdisk -l'
# eval FDISK

LSHW='lshw -short'

MOUNT='mount'
eval MOUNT

#$FDISK
#$LSHW
$MOUNT

exit