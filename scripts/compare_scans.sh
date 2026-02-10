#!/bin/bash


COUNT=$(ls ~/scans/nmap_*.txt 2>/dev/null | wc -l)

if [ "$COUNT" -lt 2 ]; then
  echo "Not enough scans to compare yet."
  exit 1
fi


ls -t ~/scans/nmap_*.txt | head -n 2 | xargs diff

