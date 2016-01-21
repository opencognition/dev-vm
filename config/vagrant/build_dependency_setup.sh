#!/usr/bin/env bash

echo "=== Begin Vagrant Provisioning using 'config/vagrant/build_dependency_setup.sh'"

# Install build dependencies for a sane build environment
apt-get -y -qq update
apt-get -y -qq install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev ruby-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev liblzma-dev libgmp-dev

echo "=== End Vagrant Provisioning using 'config/vagrant/build_dependency_setup.sh'"
