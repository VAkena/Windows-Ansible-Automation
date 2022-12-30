# Author: Vincent Akena
# Date: December 31, 2022
# Description: Setup the necessary ansible components on WSL Ubuntu 22.04

import os
import logging

# Configure logging to file
logging.basicConfig(level=logging.DEBUG, filename="wsl_ubuntu_setup.log",
                    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s', filemode='w')


def update_os():
    update_log = os.system(
        'echo vakena | sudo -S sudo apt-get update && sudo apt upgrade -y')
    logging.info(update_log)


def main():
    pass


if __name__ == "__main__":
    main()
