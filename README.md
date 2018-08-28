# Packer-AzureVM-Builder

###Setup Azure config
`chmod +x azure_setup.sh`
`./azure_setup.sh setup`

### Replace these values in ubuntu.json with respective credentials
"client_id": "xxxx",
"client_secret": "xxxx",
"tenant_id": "xxx",
"subscription_id": "xxx",


###Run Packer builder
`$ packer build ubuntu.json`

###Create VM:
`$ az vm create --resource-group packerazurebuilder --name videokenpacker --image packer-ubuntu-16 --admin-username azureuser --ssh-dest-key-path /home/azureuser/.ssh/authorized_keys --ssh-key-value ~/.ssh/id_rsa.pub`

### Add ssh keys to above created vm
`$ az vm user update --resource-group packerazurebuilder --name videokenpacker --username azureuser --ssh-key-value 'xxxx-ssh-rsa XXXXXXXXXXXX`

### Allow port number on this vm:
`$ az vm open-port --resource-group videokenpackerbuild --name videokenpacker --port 443 80 5432 6379`
