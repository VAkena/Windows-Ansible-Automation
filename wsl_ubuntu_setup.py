# Description: This script configures a Linux host to act as an Ansible host
# Tested successfully on Ubuntu 20.04 and 22.04 LTS editions

import os
import logging
import time

# Configure logging to file
logging.basicConfig(level=logging.DEBUG, filename="log.log",
                    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s', filemode='w')


# Update OS packages after initial WSL configuration
def update_os():
    commands = [
        "echo sudo_password | sudo -S sudo apt-get update && sudo apt upgrade -y"]

    # Take each command and split it before executing
    for command in commands:
        os.system(command)
        logging.info(command)


# Removes the base version of ansible that comes with Ubuntu - installs the latest version
def install_ansible():
    # List all commands required for task
    commands = ["echo sudo_password | sudo -S sudo apt remove ansible",
                "echo sudo_password | sudo -S sudo apt --purge autoremove",
                "echo sudo_password | sudo -S sudo apt-get update && sudo apt upgrade -y",
                "echo sudo_password | sudo -S sudo apt -y install software-properties-common",
                "echo sudo_password | sudo -S sudo apt-add-repository ppa:ansible/ansible",
                "echo sudo_password | sudo -S sudo apt install ansible -y"]

    # Take each command and split it before executing
    for command in commands:
        os.system(command)
        logging.info(command)


def replace_ansible_hosts():
    commands = [
        "echo sudo_password | sudo -S sudo cp -f ./hosts /etc/ansible/hosts"]

    # Take each command and split it before executing
    for command in commands:
        os.system(command)
        logging.info(command)


def main():
    # Show titles for each task that will be run
    # Give user time to see what's about to happen

    os.system('echo UPDATING ALL OS PACKAGES')
    time.sleep(3)
    update_os()

    os.system('echo INSTALLING THE LATEST VERSION OF ANSIBLE')
    time.sleep(3)
    install_ansible()

    os.system('echo REPLACING THE ANSIBLE HOSTS FILE')
    time.sleep(3)
    replace_ansible_hosts()

    #
    # TO-DO: Fix logging so we can see the outputs of each command
    # Need to get the return code values from os.system()
    #

    # Check status codes in the log file for what commands succeeded
    file = open("./log.log", "r")
    data = file.read()
    # Return code 0 means that our commands executed successfully
    status_code_count = data.count("returncode=0")

    # We check for 8 because we ran 8 commands above
    if status_code_count == 8:
        logging.info("Success return code count is: %d", status_code_count)
    else:
        logging.error(
            "Not all commands executed successfully. %d commands executed successfully. Please chect what commands failed", status_code_count)


if __name__ == "__main__":
    main()
