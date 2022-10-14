New-Item -Path $profile -Type File -Force
Copy-Item Microsoft.PowerShell_profile.ps1 -Destination $profile 