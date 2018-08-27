#!/bin/bash -e

# Download node package
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

# update system
sudo apt-get -y update

# # Install essential packages for Rails application
sudo apt-get -y install git-core libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev nodejs

sudo apt-get -y install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev

# Download & Install rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
source /home/packer/.rvm/scripts/rvm

# Install Ruby-2.3.5
rvm install 2.3.5
# Set Ruby-2.3.5 to default
rvm use 2.3.5 --default

# Install bundler
gem install bundler
