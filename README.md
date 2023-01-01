# Windows Ansible Automation

Automating the installation of software and configuring Windows after a clean install

## Authors

- [@VAkena](https://github.com/VAkena) - Developer
- Other credited developers, names are in the relevant scripts

## Where to Start
- Please read: <b>configuration_instructions.txt</b>

## Features
- Configure Windows for Ansible remote management
- Configure a Linux host to be the Ansible console
- Install Windows packages using <b>win_chocolatey</b>
- Configure basic Windows settings using the provided Windows modules

## In Development
- Package <b>.exe</b> files so they can be used for silent installs


## Requirements

`- A Windows host`

`- Your Windows host must have a local account with admin privileges`

`- A Linux host (Ubuntu 20.04 LTS or higher recommended)`

`- Python 3.8 as a minimum on your Linux host`

`- Windows Subsystem for Linux (WSL) if running Linux on Windows`

## Issues

```http
File: wsl_ubuntu_setup.py

Need to fix logging for commands run using os.system()
```
