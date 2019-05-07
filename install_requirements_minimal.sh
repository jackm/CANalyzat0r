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
   iproute2 \
   python3-pip

# Pip dependencies
pip3 install --user pipenv

# Create a new pipenv
cd $DIR
mkdir -p pipenv && cd pipenv
pipenv --three
pipenv install pyvit sphinx_rtd_theme
