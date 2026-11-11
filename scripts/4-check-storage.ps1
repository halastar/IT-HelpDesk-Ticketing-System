Write-Host "--- Inspecting Storage Drives & Free Space ---" -ForegroundColor Cyan
Get-PSDrive -PSProvider FileSystem | Select-Object Name, Root, @{Name="Used(GB)";Expression={[math]::Round($_.Used/1GB,2)}}, @{Name="Free(GB)";Expression={[math]::Round($_.Free/1GB,2)}} | Format-Table -AutoSize
