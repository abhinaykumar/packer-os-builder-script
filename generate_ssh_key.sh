#!/bin/bash -e

# generate ssh key without prompt
ssh-keygen -f $HOME/.ssh/id_rsa -t rsa -N ''

echo "-------------------------START OF SSH KEY---------------"
cat ~/.ssh/id_rsa.pub
echo "-------------------------END OF SSH KEY-----------------"
