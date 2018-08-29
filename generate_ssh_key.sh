#!/bin/bash -e

# generate ssh key without prompt
ssh-keygen -f $HOME/.ssh/id_rsa -t rsa -N ''
