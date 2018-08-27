# Packer-AzureVM-Builder

##Setup Azure config
# This command is not required if already logged in through azure-cli.
# ubuntu.json file has all the required configs
./azure_setup.sh setup

##Run Packer builder
$ packer build ubuntu.json
