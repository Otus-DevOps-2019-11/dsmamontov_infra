#!/usr/bin/env bash

apt install -y git
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
mv /tmp/reddit.service /lib/systemd/system/reddit.service
systemctl daemon-reload
systemctl enable reddit

#puma -d

#runuser -l "appuser" -c "git clone -b monolith https://github.com/express42/reddit.git /home/appuser/reddit"
#runuser -l "appuser" -c "cd ~appuser/reddit && bundle install"
#runuser -l "appuser" -c "puma -d --dir /home/appuser/reddit/"

