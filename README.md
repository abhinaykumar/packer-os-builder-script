# Packer-AzureVM-Builder

###Setup Azure config
./azure_setup.sh setup

#### Above command is not required if already logged in through azure-cli.

### Replace these values in ubuntu.json with respective credentials
"client_id": "xxxx",
"client_secret": "xxxx",
"tenant_id": "xxx",
"subscription_id": "xxx",


###Run Packer builder
$ packer build ubuntu.json
