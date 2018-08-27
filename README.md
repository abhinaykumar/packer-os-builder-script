# Packer-AzureVM-Builder

##Setup Azure config
./azure_setup.sh setup
#### Above command is not required if already logged in through azure-cli.
#### ubuntu.json file has all the required configs mentioned


##Run Packer builder
$ packer build ubuntu.json
