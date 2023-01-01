# Author: Vincent Akena
# Date: December 31, 2022
# Description: Setup the necessary ansible components on WSL Ubuntu 22.04

import os
import logging
import time
import subprocess

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
    os.system('echo vakena | sudo -S sudo apt install ansible -y')


def replace_ansible_hosts():
    # os.system('echo vakena | sudo -S sudo cp -f ./hosts /etc/ansible/hosts')
    command = subprocess.run(["ls", "-l", "./"], capture_output=True)
    logging.info(command)


def main():
    os.system('echo UPDATING ALL OS PACKAGES')
    time.sleep(3)
    update_os()

    os.system('echo INSTALLING THE LATEST VERSION OF ANSIBLE')
    time.sleep(3)
    install_ansible()

    os.system('echo REPLACING THE ANSIBLE HOSTS FILE')
    time.sleep(3)
    replace_ansible_hosts()


if __name__ == "__main__":
    main()
