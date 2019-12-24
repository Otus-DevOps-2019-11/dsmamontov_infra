#!/usr/bin/env bash

###

wget -qO - https://www.mongodb.org/static/pgp/server-3.6.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
sudo apt-get update
sudo apt-get install -y mongodb-org
systemctl start mongod
systemctl enable mongod

###

apt update && apt install -y ruby-full ruby-bundler build-essential

###

runuser -l "ubuntu" -c "git clone -b monolith https://github.com/express42/reddit.git /home/ubuntu/reddit"
runuser -l "ubuntu" -c "cd ~ubuntu/reddit && bundle install"
runuser -l "ubuntu" -c "puma -d --dir /home/ubuntu/reddit/"
