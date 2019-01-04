# Packer-AzureVM-Builder

## Setup Image and VM from the scratch

### Setup Azure config
`chmod +x azure_setup.sh`
`./azure_setup.sh setup`

### Replace these values in ubuntu.json with respective credentials
"client_id": "xxxx",
"client_secret": "xxxx",
"tenant_id": "xxx",
"subscription_id": "xxx",


### Run Packer builder
`$ packer build ubuntu.json`

### Create VM:
`$ az vm create --resource-group Staging --name videokenpacker --image packer-ubuntu-16-04 --admin-username azureuser --ssh-dest-key-path /home/azureuser/.ssh/authorized_keys --ssh-key-value ~/.ssh/id_rsa.pub`

### Add ssh keys to above created vm
`$ az vm user update --resource-group Staging --name videokenpacker --username azureuser --ssh-key-value 'xxxx-ssh-rsa XXXXXXXXXXXX`

### Allow port number on this vm:
`$ az vm open-port --resource-group Staging --name videokenpacker --port 443 80 5432 6379`


### Add required files
* Create/Copy `database.yml` & `application.yml` inside `videoken/shared/config/` directory
* Create/Copy `Passengerfile.json` inside `videoken/shared` directory

### nginx setup
* In the file: `/etc/nginx/sites-available/rails`
  * add private IP of the instance
as a server inside `upstream` section.

### Deploy keys
* Add server's SSH key to bitbucket's deploy keys.

### Capistrano
* In the file app/config/deploy/packer.rb
  * Update the public IP of the instance
* run `$ cap packer deploy`

## Spin up new VM by passing required params
* `env='staging' vm_name='videokenpacker' image_name='packer-ubuntu-16-04' bash spin_new_instance.sh`
  * `env`, could be `staging` or `production`
  * `vm_name`, could be any name
  * `image_name`, should match the name of the OS image prepared by packer
