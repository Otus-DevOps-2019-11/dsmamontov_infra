# dsmamontov_infra
dsmamontov Infra repository
```
testapp_IP = 35.224.64.222 
testapp_port = 9292


gcloud compute instances create reddit-app --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --metadata-from-file startup-script=startup-script.sh

gcloud compute firewall-rules create default-puma-server --allow tcp:9292 --source-tags=puma-server --source-ranges=0.0.0.0/0 
```
