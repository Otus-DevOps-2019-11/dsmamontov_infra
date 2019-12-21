# dsmamontov_infra
dsmamontov Infra repository


bastion_IP = 35.230.101.179
someinternalhost_IP = 10.128.0.2

ssh -L 2222:10.128.0.2:22 OpenSSH-rsa-import-101417@35.230.101.179
ssh -p 2222 OpenSSH-rsa-import-101417@localhost
