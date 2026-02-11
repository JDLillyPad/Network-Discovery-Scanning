# Network Baseline Report (Sanitized)

## Date of Scan
2026-02-10

## Scan Method
Command used:
nmap -sn 192.168.1.0/24

Ping scan used to identify active hosts on the local subnet.

---

## Summary of Findings

Total Active Hosts Detected: 6

| Host Identifier | IP Address (Sanitized) | Status |
|-----------------|------------------------|--------|
| Router          | 192.168.1.1            | Up     |
| Raspberry Pi    | 192.168.1.10           | Up     |
| Laptop          | 192.168.1.20           | Up     |
| Smart TV        | 192.168.1.30           | Up     |
| Mobile Device   | 192.168.1.40           | Up     |
| Printer         | 192.168.1.50           | Up     |

---

## Baseline Purpose

This scan establishes a baseline of expected devices on the local network.
Future scans are compared against this list to detect:

- New devices appearing on the network
- Devices that are no longer responding
- Unexpected changes in network inventory

---

## Security Considerations

- All IP addresses have been sanitized for privacy.
- Hostnames have been generalized.
- This report reflects a controlled home lab environment.

---

## Observations

- No unexpected hosts detected during this scan.
- All known infrastructure devices responded normally.
- This baseline will be used for automated comparison using Bash scripts.

---

## Next Steps

- Automate daily scans via cron.
- Implement automated difference detection.
- Forward scan results to centralized logging for further analysis.



