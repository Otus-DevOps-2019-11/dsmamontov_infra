#!/usr/bin/env bash

#wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
#echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
#sudo apt-get update
#sudo apt-get install -y mongodb-org
#systemctl start mongod
#systemctl enable mongod

#apt update && apt install -y ruby-full ruby-bundler build-essential

#sudo apt-get update
#sudo apt install -y ruby-full ruby-bundler build-essential

wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
sudo apt update
sudo apt install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod

sudo apt install -y git
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d

#runuser -l "appuser" -c "git clone -b monolith https://github.com/express42/reddit.git /home/appuser/reddit"
#runuser -l "appuser" -c "cd ~appuser/reddit && bundle install"
#runuser -l "appuser" -c "puma -d --dir /home/appuser/reddit/"
