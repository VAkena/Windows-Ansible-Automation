# Windows Chocolatey Automation

Automating the installation of software for a clean Windows install

## Authors

- [@VAkena](https://github.com/VAkena) - Developer

## Features
- Use Chocolatey to silently install existing packages
- Package <b>.exe</b> files into Chocolatey packages


## Requirements

`Download Chocolatey for Individuals`

`PowerShell in elevated privilege mode`

## Issues

#### Current limitations include

```http
Unable to automate installation of executable files
Conversion to MSI may be required (need to explore custom Chocolatey packages)
```

```http
Need to develop a configuration script for a silent Windows install
After installation, need to start PowerShell in admin mode to run Chocolatey scripts
```
