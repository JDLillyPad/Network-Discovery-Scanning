#!/bin/bash

# When only one file exists, add the guard
COUNT=$(ls ~/filepathto/nmap_*.txt 2>/dev/null | wc -l)

if [ "$COUNT" -lt 2 ]; then
  echo "Not enough scans to compare yet."
  exit 1
fi
# ls -t ~/scans/nmap_*.txt lists all scan files sorted by time, newest first
# head -n 2 takes the first two lines
# xargs diff, takes input from STDIN and turns it into arguments for a command (diff)

ls -t ~/filepathto/nmap_*.txt | head -n 2 | xargs diff

