# !!! IMPORTANT !!!
# Get thumbprint by running: WinRM_Listener_1.ps1

Write-Host("Get HTTPS Thumbprint")
$thumbprint = "your_thumbprint"
Get-ChildItem -Path cert:\LocalMachine\My -Recurse | Where-Object { $_.Thumbprint -eq $thumbprint } | Select-Object *

# -----------------------------------------------------------------------------------------------------------------------------------------------

# Setup WinRM Listener

Write-Host("Setup WinRM Listener")
$selector_set = @{
    Address   = "*"
    Transport = "HTTPS"
}
$value_set = @{
    CertificateThumbprint = "your_thumbprint"
}

New-WSManInstance -ResourceURI "winrm/config/Listener" -SelectorSet $selector_set -ValueSet $value_set

# -----------------------------------------------------------------------------------------------------------------------------------------------

# WinRM Service Options
# Thse commands show the current service configuration options

Write-Host("WinRM Service Options")
winrm get winrm/config/Service
winrm get winrm/config/Winrs