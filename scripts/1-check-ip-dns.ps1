Write-Host "--- Checking Network Interface, IP & DNS ---" -ForegroundColor Cyan
Get-NetIPConfiguration | Select-Object InterfaceAlias, IPv4Address, IPv4DefaultGateway, DNSServer | Format-Table -AutoSize
