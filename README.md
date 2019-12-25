# dsmamontov_infra
dsmamontov Infra repository

задание: cloud-bastion
```
Host someinternalhost
	HostName 35.230.101.179
	User appuser
	LocalForward 2222 10.138.0.5:22
```

```
bastion_IP = 35.230.101.179
someinternalhost_IP = 10.138.0.5

ssh -L 2222:10.138.0.5:22 appuser@35.230.101.179
ssh -p 2222 appuser@localhost
```

заданиe: test-app
```
testapp_IP = 35.224.189.166 
testapp_port = 9292

gcloud compute instances create reddit-app --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --metadata-from-file startup-script=startup-script.sh
gcloud compute firewall-rules create default-puma-server --allow tcp:9292 --source-tags=puma-server --source-ranges=0.0.0.0/0 
```
