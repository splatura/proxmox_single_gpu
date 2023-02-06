#!/bin/bash

if [ $2 == "pre-start" ]
then
    echo "gpu-hookscript: Resetting GPU for Virtual Machine $1"
    echo 1 > /sys/bus/pci/devices/0000:0c:00.0/remove
    echo 1 > /sys/bus/pci/rescan
fi
