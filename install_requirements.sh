#!/bin/bash

set -o pipefail

# The dir of the start script (this file)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export LC_ALL=C.UTF-8
export LANG=C.UTF-8

# Apt dependencies
sudo apt-get -qq update
sudo apt-get -y install \
   can-utils \
#   ffmpeg \
   iproute2 \
   python3-pip \
#   python3-pyside \
#   python3.5

# Pip dependencies
pip3 install --user pipenv

# Create a new pipenv
cd $DIR
mkdir -p pipenv && cd pipenv
pipenv --three
pipenv install pyvit sphinx_rtd_theme
#cp -rf /usr/lib/python3/dist-packages/PySide $(pipenv --venv)/lib/python3*/site-packages
