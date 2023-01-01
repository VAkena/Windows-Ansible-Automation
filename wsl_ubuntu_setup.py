import os
import logging
import time

# Configure logging to file
logging.basicConfig(level=logging.DEBUG, filename="log.log",
                    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s', filemode='w')


# Update OS packages after initial WSL setup
def update_os():
    commands = [
        "echo vakena | sudo -S sudo apt-get update && sudo apt upgrade -y"]

    # Take each command and split it before executing
    for c in commands:
        os.system(c)
        logging.info(c)


# Removes the base version of ansible that comes with Ubuntu - installs the latest version
def install_ansible():
    # List all commands required for task
    commands = ["echo vakena | sudo -S sudo apt remove ansible",
                "echo vakena | sudo -S sudo apt --purge autoremove",
                "echo vakena | sudo -S sudo apt-get update && sudo apt upgrade -y",
                "echo vakena | sudo -S sudo apt -y install software-properties-common",
                "echo vakena | sudo -S sudo apt-add-repository ppa:ansible/ansible",
                "echo vakena | sudo -S sudo apt install ansible -y"]

    # Take each command and split it before executing
    for c in commands:
        os.system(c)
        logging.info(c)


def replace_ansible_hosts():
    commands = ["echo vakena | sudo -S sudo cp -f ./hosts /etc/ansible/hosts"]

    # Take each command and split it before executing
    for c in commands:
        os.system(c)
        logging.info(c)


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
