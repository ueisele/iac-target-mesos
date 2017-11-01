#!/bin/bash
cd $(dirname $(readlink -f $0))

vagrant destroy -f
