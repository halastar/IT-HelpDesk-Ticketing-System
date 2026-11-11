Write-Host "--- Current User & Local Account Information ---" -ForegroundColor Cyan
whoami
Get-LocalUser | Select-Object Name, Enabled, LastLogon | Format-Table -AutoSize
