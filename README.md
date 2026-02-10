# Network-Discovery-Scanning

## Project Goal
The Network Discovery and Scanning project uses the Raspberry Pi to do network discovery and scanning with nmap, arp-scan, and netdiscover to map a home network. We can automate these tasks by running a simple script.

### Skills Learned

- Reconnaissance, IP ranges, automation basics.
- Development of critical thinking and problem-solving skills in cybersecurity.

### Tools Used

- nmap, arp-scan and netdiscover (In Progress)

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

## Automate Daily Scan (Coming Soon)
I want to create a simple bash script to automate this daily scan and compare changes. 
