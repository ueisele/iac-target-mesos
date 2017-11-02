#!/bin/bash
cd $(dirname $(readlink -f $0))

vagrant up --no-provision
ANSIBLE_HOST_KEY_CHECKING=false vagrant provision
