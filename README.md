# dsmamontov_infra
dsmamontov Infra repository

#задание: terraform-1

проблема 1

пользователи как минимум создаются в странном порядке

```
appuser:x:1001:1002::/home/appuser:/bin/bash
mongodb:x:113:65534::/home/mongodb:/bin/false
appuser2:x:1002:1003::/home/appuser2:/bin/bash
appuser_web:x:1003:1004::/home/appuser_web:/bin/bash
appuser1:x:1004:1005::/home/appuser1:/bin/bash
```

проблема 2

пользователь appuser_web не виден в метаданных через apply

больше проблем не нашёл)


по заданию с 2 звёздами

созданы: 
* ресурс пул (я так и не понял чем он отличается от связки бекенд и инстанс групп), 
* healthcheck ( заработал нормально только депрекейтед https://www.terraform.io/docs/providers/google/r/compute_http_health_check.html, нормальный https://www.terraform.io/docs/providers/google/r/compute_health_check.html отказывался подниматься с таргет пулом)
* google_compute_forwarding_rule (нашел только как один в один порт прокинуть в нем)





#задание: cloud-bastion
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

#заданиe: test-app
```
testapp_IP = 35.224.189.166 
testapp_port = 9292

gcloud compute instances create reddit-app --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --metadata-from-file startup-script=startup-script.sh
gcloud compute firewall-rules create default-puma-server --allow tcp:9292 --source-tags=puma-server --source-ranges=0.0.0.0/0 
```

#здание: packer-base

собран образ reddit-full и запечен так, чтобы приложеие стартовало после создания ВМ.
в образ вшиты все пакеты и системд-юнит
новую ВМ можно поднять из консоли скриптом ```create-reddit-vm.sh ```
