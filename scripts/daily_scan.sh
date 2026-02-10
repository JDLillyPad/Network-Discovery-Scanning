#!/bin/bash

DATE=$(date +"%Y-%m-%d")
TARGET="10.0.0.47/24"
OUTPUT="$HOME/scans/nmap_$DATE.txt"

nmap -sn $TARGET > $OUTPUT

