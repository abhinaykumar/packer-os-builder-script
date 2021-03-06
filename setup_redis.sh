#!/bin/bash -e

sudo apt-get -y install redis-server

# # Below are the steps for compiling and installing redis from source
# cd /tmp

# # Download and build redis
# wget http://download.redis.io/redis-stable.tar.gz
# tar xvzf redis-stable.tar.gz
# cd redis-stable
# make
# sudo make install

# # Move redis from tmp to /etc/redis
# sudo mkdir /etc/redis
# sudo cp /tmp/redis-stable/redis.conf /etc/redis


# # replace `supervised no` with `supervised systemd` in order to run redis on
# # system reboot
# sudo sed -i 's/supervised no/supervised systemd/g' /etc/redis/redis.conf

# # replace update default dir for redis data store
# sudo sed -i 's#dir ./#dir /var/lib/redis#g' /etc/redis/redis.conf

# # create redis init daemon service file
# sudo touch /etc/systemd/system/redis.service

# # write configs to redis unit file
# printf '[Unit]\nDescription=Redis In-Memory Data Store\nAfter=network.target\n\n
# [Service]\nUser=redis\nType=forking\nPIDFile=/var/run/redis/redis.pid\nGroup=redis\nExecStart=/usr/local/bin/redis-server /etc/redis/redis.conf\n
# ExecStop=/usr/local/bin/redis-cli shutdown\nRestart=always\n\n[Install]\nWantedBy=multi-user.target\n' | sudo tee /etc/systemd/system/redis.service

# # Add redis user
# sudo adduser --system --group --no-create-home redis

# sudo mkdir /var/lib/redis
# sudo chown redis:redis /var/lib/redis

# sudo chmod 770 /var/lib/redis

# # Start & Check status of redis through systemctl
# sudo systemctl start redis

# sudo systemctl status redis

# sudo systemctl enable redis

# # print out current status of redis
# echo `journalctl -xe`
