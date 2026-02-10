# Network-Discovery-Scanning

## Project Goal
This project was created as part of a cybersecurity home lab to practice foundational SOC skills such as
network discovery, automation, and change detection.

A Raspberry Pi is used to run scheduled Nmap scans of the local network, store results, and compare
consecutive scans to identify new or missing devices.

### Skills Learned

- Reconnaissance, IP ranges, automation basics.
- Development of critical thinking and problem-solving skills in cybersecurity.

### Tools & Technologies

- Raspberry Pi OS Lite
- Bash scripting
- Nmap
- Cron (Linux task scheduler)
- diff and xargs
- Git & GitHub

## Steps

## Reconnaissance, IP ranges, automation basics 
We will explore the use of nmap, arp-scan, and netdiscover. 
Tools & purpose (short)
   - nmap — full-featured port/host scanner. Great for identifying hosts, open ports, OS guesses and services. Use when you want detailed info.
   - arp-scan — fast local LAN scanner that queries the ARP table. Excellent for quickly finding all IPv4 devices adn their respective MAC addresses on your Ethernet/Wi-Fi subnet. 
   - netdiscover — passive/active arp-based discovery; simple and quick for sniffing hosts on the LAN (useful if DHCP is active).
       
First you need to update and install all three tools to your Raspberry Pi
1. sudo apt update && sudo apt install -y nmap arp-scan netdiscover

## Identify your local network/subnet
You need the interface and subnet (example: 192.168.1.0/24)
Find IP and interface:
1. ip -4 addr show
   - using this will show your loopback address (127.0.0.1) which you can ignore. My interface is wlan0
2.   hostname -I

## Quick Scan for Fast Arp scan and Netdiscover
For Arp-Scan
1. sudo arp-scan --interface=wlan0 --localnet
   - For netdiscover
2. sudo netdiscover -i wlan0 -r 192.168.1.0/24
   - This scan gave me more details about the MAC Vendor.
## Nmap - Simple ping sweep to list live hosts. This gives the same information as arp-scan and netdiscover
1. sudo nmap -sn 192.168.1.0/24

## Nmap Lets pick a host and scan with ports and services (deeper)
1. sudo nmap -sS -sV -O -p- 192.168.1.12
   - sS is a TCP SYN (stealth) scan
   - sV is a service/version detection
   - O will detect operating system
   - -p- scans all 65535 ports (slow; you can restrict to just the common ports using --top-ports 1000)

## Automate Daily Scan
I want to create a simple bash scripts to automate a daily simple nmap scan and compare changes. 

### Project Structure

scripts/
- daily_scan.sh        # Runs a network discovery scan and saves output
- compare_scans.sh     # Compares the two most recent scans for changes

scans/
- sample_nmap_output.txt   # Sanitized example scan output (In progress)

### How It Works

#### Daily Network Scan
The `daily_scan.sh` script runs an Nmap ping scan against the local subnet and saves the results
to a timestamped file. This creates a historical record of network state.

#### Change Detection
The `compare_scans.sh` script dynamically selects the two most recent scan files and uses `diff`
to identify differences. This allows detection of new devices or devices that are no longer responding.

#### Automation
The scan script is scheduled using `cron` to run automatically once per day, ensuring consistent
and repeatable data collection without manual intervention.

## Skills Demonstrated

- Network discovery and asset awareness
- Linux command-line proficiency
- Bash automation
- Baseline creation and anomaly detection
- Secure system operation

## Lessons Learned

- Even simple automation can significantly reduce manual effort
- Establishing a baseline is critical for detecting abnormal behavior
- Linux pipelines and tools like `xargs` are powerful for chaining tasks together
- Documentation is as important as the technical implementation
