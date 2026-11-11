Write-Host "--- Inspecting Core Windows Services ---" -ForegroundColor Cyan
Get-Service -Name Spooler, Dhcp, Dnscache, W32Time | Select-Object Name, DisplayName, Status | Format-Table -AutoSize
