# IT Help Desk – Ticketing & Troubleshooting Log

### Ticket 001: User Locked Out
* **Problem Description:** User reports receiving an error stating "The referenced account is currently locked out and may not be logged on to" when attempting to sign in.
* **Troubleshooting Steps:** Verified user identity over phone. Checked user status using `Get-LocalUser` (or Active Directory Users & Computers) and confirmed the account lockout flag was triggered due to multiple failed password attempts.
* **Root Cause:** User exceeded the maximum invalid logon attempts threshold (likely due to a cached old password on a mobile device).
* **Resolution:** Unlocked the user account using `Unlock-ADAccount` / local user properties and advised the user to update saved credentials on their phone.
* **Status:** Resolved

### Ticket 002: Forgotten Password
* **Problem Description:** User is unable to access their workstation after returning from vacation and cannot recall their password.
* **Troubleshooting Steps:** Verified employee ID and manager approval according to security policy. Inspected account status via `Get-LocalUser` to ensure account was active and not disabled.
* **Root Cause:** User forgot credentials after an extended leave of absence.
* **Resolution:** Performed a secure password reset, checked "User must change password at next logon," and verified successful login.
* **Status:** Resolved

### Ticket 003: No Internet Connectivity
* **Problem Description:** User reports they cannot browse external websites or access cloud applications.
* **Troubleshooting Steps:** Ran `Get-NetIPConfiguration` to check IP address and default gateway. Ran `Test-NetConnection -ComputerName 8.8.8.8` to test external ICMP reachability.
* **Root Cause:** Network adapter failed to obtain a valid DHCP lease and defaulted to an APIPA (`169.254.x.x`) address.
* **Resolution:** Checked `Get-Service -Name Dhcp` to confirm the DHCP Client service was running, then renewed the IP lease using `ipconfig /release` and `ipconfig /renew`. Verified connectivity via `Test-NetConnection`.
* **Status:** Resolved

### Ticket 004: DNS Not Resolving
* **Problem Description:** User can connect to internal IP addresses, but web browsers fail with "DNS_PROBE_FINISHED_NXDOMAIN" when typing domain names.
* **Troubleshooting Steps:** Tested raw IP connectivity with `Test-NetConnection -ComputerName 8.8.8.8` (Succeeded) vs. domain name `Test-NetConnection -ComputerName google.com` (Failed). Inspected configured DNS servers via `Get-NetIPConfiguration` and checked DNS Client service with `Get-Service -Name Dnscache`.
* **Root Cause:** Corrupted local DNS resolver cache and an outdated secondary DNS server entry.
* **Resolution:** Cleared the local DNS cache using `Clear-DnsClientCache`, restarted the `Dnscache` service, and verified name resolution with `Resolve-DnsName`.
* **Status:** Resolved

### Ticket 005: Cannot Access Shared Folder
* **Problem Description:** User receives an "Access Denied" error when attempting to open the `\\Server\Finance` network share.
* **Troubleshooting Steps:** Tested network path to the file server using `Test-NetConnection -ComputerName FileServer01 -Port 445`. Checked mapped drives via `Get-PSDrive` and audited NTFS/Share permissions on the folder.
* **Root Cause:** User account lacked Read/Modify permissions on the target shared folder.
* **Resolution:** Added the user's security group to the folder's NTFS and Share permissions with Modify access, and verified the user could open the directory.
* **Status:** Resolved

### Ticket 006: Slow Computer Performance
* **Problem Description:** User complains that applications take several minutes to open and Windows freezes frequently.
* **Troubleshooting Steps:** Inspected storage capacity using `Get-PSDrive -PSProvider FileSystem` to check for low disk space. Audited running background services via `Get-Service` and checked Task Manager for high CPU/RAM utilization.
* **Root Cause:** The primary `C:` drive had less than 1% free space remaining, preventing Windows from managing virtual memory (pagefile) efficiently.
* **Resolution:** Cleaned up temporary files, cleared browser caches, and removed outdated Windows update files to free up 25 GB of space on `C:`. System responsiveness returned to normal.
* **Status:** Resolved

### Ticket 007: Printer Not Working
* **Problem Description:** User sends documents to the office network printer, but jobs remain stuck in the print queue and never print.
* **Troubleshooting Steps:** Tested network connectivity to the printer IP using `Test-NetConnection`. Inspected local printing dependencies using `Get-Service -Name Spooler`.
* **Root Cause:** The Windows Print Spooler (`Spooler`) service had crashed and was in a `Stopped` state with a corrupted print job stuck in the spool folder.
* **Resolution:** Stopped the service, cleared stuck files from `C:\Windows\System32\spool\PRINTERS`, and ran `Start-Service -Name Spooler`. Verified with a test page.
* **Status:** Resolved

### Ticket 008: User Needs Application/Folder Access
* **Problem Description:** Newly hired marketing coordinator requests access to the Marketing shared drive and internal CRM tools.
* **Troubleshooting Steps:** Confirmed access request approval from the Marketing Department Manager. Audited user's current group memberships using `whoami /groups` (or AD DS).
* **Root Cause:** User account was provisioned with default domain user permissions only and had not yet been added to department-specific security groups.
* **Resolution:** Assigned the user to the `SG-Marketing-Users` Active Directory security group and instructed the user to sign out and back in to refresh their security token.
* **Status:** Resolved
