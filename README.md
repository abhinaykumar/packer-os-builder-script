# Packer-AzureVM-Builder

### Replace these values in ubuntu.json with respective credentials
"client_id": "xxxx",
"client_secret": "xxxx",
"tenant_id": "xxx",
"subscription_id": "xxx",


### Run Packer builder
`$ packer build ubuntu.json`


### After creating VM
* Open ports 22, 80, 6000
* Create/Copy `database.yml` & `application.yml` inside `videoken/shared/config/` directory
* Create/Copy `Passengerfile.json` inside `videoken/shared` directory
* Edit `/etc/filebeat/filebeat.yml` and start filebeat
* Copy EduVideoClassifier model into the home directory


### Deployment
* Add server's SSH key to bitbucket's deploy keys.
* Update capistrano config with the VM ip-address

