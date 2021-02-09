#!/bin/bash

apt install -y python3
apt install -y python3-pip
# Required to fix error - ModuleNotFoundError: No module named '_ctypes'
apt install -y libffi-dev


#apt install -y libreadline-dev/eoan libssl-dev/eoan libbz2-dev/eoan

