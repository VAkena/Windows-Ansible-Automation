# Author: Vincent Akena
# Date: December 31, 2022
# Description: Setup the necessary ansible components on WSL Ubuntu 22.04

import os
import logging

# Configure logging to file
logging.basicConfig(level=logging.DEBUG, filename="log.log",
                    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s', filemode='w')


# Update OS packages after initial WSL setup
def update_os():
    os.system(
        'echo vakena | sudo -S sudo apt-get update && sudo apt upgrade -y')


# Removes the base version of ansible that comes with Ubuntu - installs the latest version
def install_ansible():
    os.system('echo vakena | sudo -S sudo apt remove ansible')
    os.system('echo vakena | sudo -S sudo apt --purge autoremove')
    os.system('echo vakena | sudo -S sudo apt-get update && sudo apt upgrade -y')
    os.system('echo vakena | sudo -S sudo apt -y install software-properties-common')
    os.system('echo vakena | sudo -S sudo apt-add-repository ppa:ansible/ansible')
    os.system('echo vakena | sudo -S sudo apt install ansible')


def main():
    os.system('echo ### Updating OS packages ###')
    update_os()
    os.system('echo ### Installing latest version of Ansible ###')
    install_ansible()


if __name__ == "__main__":
    main()
