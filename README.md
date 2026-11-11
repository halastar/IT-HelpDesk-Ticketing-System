# IT Help Desk: Ticketing & Troubleshooting System

A practical IT Help Desk portfolio project demonstrating structured incident management, root cause analysis, and Windows PowerShell diagnostic scripting.

##  Project Overview
This repository simulates an enterprise Tier 1 / Tier 2 IT Help Desk workflow. It combines **8 documented support tickets** (covering account lockouts, password resets, network/DNS failures, permissions, performance, printing, and AD group access) with **5 custom PowerShell diagnostic scripts** used to investigate and resolve system issues.

##  PowerShell Tools & Cmdlets Used
* **`Get-NetIPConfiguration`**: Inspected network interface details, IPv4 addresses, default gateways, and DNS server assignments.
* **`Test-NetConnection`**: Tested remote network connectivity, ICMP ping responses, and specific TCP ports (e.g., Port 443, Port 445).
* **`Get-Service`**: Audited the operational state of critical Windows services (`Spooler`, `Dhcp`, `Dnscache`, `W32Time`).
* **`Get-PSDrive`**: Inspected storage volumes, file systems, and available disk space to diagnose performance and storage issues.
* **`whoami` & `Get-LocalUser`**: Verified user identity, account status, and group memberships.

##  Repository Contents
* `/tickets/HelpDesk-Tickets-Log.md` — Detailed documentation of Tickets `001` through `008` (Problem Description, Troubleshooting Steps, Root Cause, Resolution, and Status).
* `/scripts/1-check-ip-dns.ps1` — Audits local IP, gateway, and DNS settings.
* `/scripts/2-test-connectivity.ps1` — Tests external internet and port connectivity.
* `/scripts/3-check-services.ps1` — Checks the status of essential Windows services.
* `/scripts/4-check-storage.ps1` — Calculates used and free disk space in GB.
* `/scripts/5-check-user-info.ps1` — Displays current user context and local account states.
