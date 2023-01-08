# Documentation link: https://docs.ansible.com/ansible/2.5/user_guide/windows_setup.html

# WinRM Memory Hotfix
# When running on PowerShell v3.0, there is a bug with the WinRM service that limits the amount of memory available to WinRM
# Without this hotfix installed, Ansible will fail to execute certain commands on the Windows host

Write-Host("WinRM Memory Hotfix")
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

Write-Host("NOW RUN THIS SCRIPT: WinRM_Listener_1.ps1 ")