#!/bin/bash
# Runs a daily Nmap ping scan and stores results for baseline comparison
DATE=$(date +"%Y-%m-%d")
# I've entered a loopback address but feel free to input your CIDR IP Address
TARGET="127.0.0.1/24"
OUTPUT="$HOME/filepathtoscans/nmap_$DATE.txt"

nmap -sn $TARGET > $OUTPUT

