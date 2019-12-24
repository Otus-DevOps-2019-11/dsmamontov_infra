#!/usr/bin/env bash

###

wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
systemctl start mongod
systemctl enable mongod

###

apt update && apt install -y ruby-full ruby-bundler build-essential

###

runuser -l "appuser" -c "git clone -b monolith https://github.com/express42/reddit.git /home/appuser/reddit"
runuser -l "appuser" -c "cd ~appuser/reddit && bundle install"
runuser -l "appuser" -c "puma -d --dir /home/appuser/reddit/"
