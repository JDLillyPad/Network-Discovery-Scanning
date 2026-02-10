#!/bin/bash

DATE=$(date +"%Y-%m-%d")
# I've entered a loopback address but feel free to input your CIDR IP Address
TARGET="127.0.0.1/24"
OUTPUT="$HOME/scans/nmap_$DATE.txt"

nmap -sn $TARGET > $OUTPUT

