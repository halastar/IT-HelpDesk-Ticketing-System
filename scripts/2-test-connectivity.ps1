Write-Host "--- Testing Internet & DNS Connectivity ---" -ForegroundColor Cyan
Test-NetConnection -ComputerName 8.8.8.8
Test-NetConnection -ComputerName google.com -Port 443
