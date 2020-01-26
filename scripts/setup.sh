#!/bin/bash

scripts_directory="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" >/dev/null 2>&1 && pwd  )"

echo "setup::installing ansible requirements"
ansible-galaxy install -r "${scripts_directory}/../ansible/requirements.yml"

echo "setup::setup local machine with project dependencies (SUDO password required for homebrew)"
ansible-playbook ansible/playbooks/setup-local.yml -K

