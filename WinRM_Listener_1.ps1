# The WinRM services listens for requests on one or more ports. Each of these ports must have a listener created and configured.
Write-Host("WinRM Listener")
winrm enumerate winrm/config/Listener
Write-Host("!!! COPY THE DISPLAYED THUMBPRINT FOR HTTPS !!!")
Write-Host("NOW RUN THIS SCRIPT: WinRM_Listener_2.ps1 ")