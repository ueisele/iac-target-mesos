#!/bin/bash
cd $(dirname $(readlink -f $0))

vagrant up --no-provision
vagrant provision
