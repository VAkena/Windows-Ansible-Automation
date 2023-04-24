# STEP 1: UPDATING POWERSHELL
# .AUTHOR
#     Jordan Borean <jborean93@gmail.com>
# .COPYRIGHT
#     Jordan Borean 2017
# Run script as admin

Write-Host("STEP 1: UPDATING POWERSHELL VERSION")
Start-Sleep -Seconds 5

$url = "https://raw.githubusercontent.com/jborean93/ansible-windows/master/scripts/Upgrade-PowerShell.ps1"
$file = "$env:temp\Upgrade-PowerShell.ps1"
$username = "username"
$password = "password"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

# version can be 3.0, 4.0 or 5.1
&$file -Version 5.1 -Username $username -Password $password -Verbose

# ------------------------------------------------------------------------

# STEP 2: RUN WINRM SETUP

# Documentation link: https://docs.ansible.com/ansible/2.5/user_guide/windows_setup.html

# WinRM Memory Hotfix
# When running on PowerShell v3.0, there is a bug with the WinRM service that limits the amount of memory available to WinRM
# Without this hotfix installed, Ansible will fail to execute certain commands on the Windows host

Write-Host("STEP 2: CONFIGURING THE WINRM MEMORY HOTFIX")
Start-Sleep -Seconds 5

$url = "https://raw.githubusercontent.com/jborean93/ansible-windows/master/scripts/Install-WMF3Hotfix.ps1"
$file = "$env:temp\Install-WMF3Hotfix.ps1"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
powershell.exe -ExecutionPolicy ByPass -File $file -Verbose

# -----------------------------------------------------------------------------------------------------------------------------------------------

# Once Powershell has been upgraded, the final step is for the WinRM service to be configured so that Ansible can connect to it
# There are two main components of the WinRM service: the listener and the service configuration setting

Write-Host("WinRM Setup")
$url = "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"
$file = "$env:temp\ConfigureRemotingForAnsible.ps1"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)

powershell.exe -ExecutionPolicy ByPass -File $file


# STEP 3: RUN WINRM LISTENER 1
# The WinRM services listens for requests on one or more ports. Each of these ports must have a listener created and configured.
Write-Host("STEP 3: CONFIGURING WINRM LISTENER V1 SCRIPT")
Start-Sleep -Seconds 5
winrm enumerate winrm/config/Listener

# STEP 4: RUN WINRM LISTENER 2
# !!! IMPORTANT !!!
# Get thumbprint by running: WinRM_Listener_1.ps1

Write-Host("STEP 4: CONFIGURING WINRM LISTENER V2 SCRIPT")
Start-Sleep -Seconds 5

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

Write-Host("STEP 5: RUNNING THE ANSIBLE REMOTING SCRIPT")
Start-Sleep -Seconds 5

# STEP 5: Run the Ansible Remoting Script
PowerShell.exe -File '.\Ansible_Remoting.ps1'


# ---------------------------------------------------------------------------------------------------------------------------------
Write-Host("STEP 6: EXECUTING THE WINDOWS DEBLOAT SCRIPT")
Start-Sleep -Seconds 5

# STEP 6: Run the Windows Debloating Script
powershell.exe -File '.\Windows_Debloat.ps1'