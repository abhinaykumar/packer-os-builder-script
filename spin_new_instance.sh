#!/bin/bash -e

#Create VM using arguments supplied
res_grp=
if [ "$env" = "staging" ]; then
  res_grp="Staging"
elif [ "$env" = "production" ]; then
  res_grp="VideokenOffshore"
fi

if [ "$image_name" = "" ]; then
  image_name="packer-ubuntu-16-04"
fi

az vm create --resource-group $res_grp --name $vm_name --image $image_name --admin-username packer --ssh-dest-key-path /home/packer/.ssh/authorized_keys --ssh-key-value ~/.ssh/videoken-production.pub

# use below code to copy database.yml application.yml and Passengerfile.json to new instance
# scp ubuntu@`echo $output | jq -r '.publicIpAddress'`:~/test.txt ./
# echo $output | jq -r '.privateIpAddress'

### Allow port number on this vm:
az vm open-port --resource-group $res_grp --name $vm_name --port 6000 --priority 300

## TO DOWNLOAD CONFIG FILES FROM THE PRODUCTION OR BOSCH SERVER
################################################################################
# SHARED_DIR="videoken/shared"
# scp ubuntu@40.65.110.22:"~/$SHARED_DIR/config/database.yml ~/$SHARED_DIR/config/application.yml ~/$SHARED_DIR/Passengerfile.json" ./app_config
#
# if [ $? -eq 0 ];
# then
#     echo "===> database and application config files have been copied successfully <==="
# else
#   scp ubuntu@52.191.161.90:"~/$SHARED_DIR/config/database.yml ~/$SHARED_DIR/config/application.yml ~/$SHARED_DIR/Passengerfile.json" ./app_config
# fi
#
# if [ $? -ne 0 ];
# then
#   echo "===> could not download database and application files!!! <==="
# fi
################################################################################
