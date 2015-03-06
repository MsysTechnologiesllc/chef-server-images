#!/bin/bash

#
# From https://github.com/mitchellh/packer/issues/1054
#

sudo mkdir -p /etc/chef

mkdir /tmp/packer-chef-client
chmod 0755 /tmp/packer-chef-client


sudo mkdir -p /var/log/chef


exit 0
