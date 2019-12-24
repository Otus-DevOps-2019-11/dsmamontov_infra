# dsmamontov_infra
dsmamontov Infra repository

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
