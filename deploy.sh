#!/usr/bin/env bash

sudo apt install -y git
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d

#runuser -l "appuser" -c "git clone -b monolith https://github.com/express42/reddit.git /home/appuser/reddit"
#runuser -l "appuser" -c "cd ~appuser/reddit && bundle install"
#runuser -l "appuser" -c "puma -d --dir /home/appuser/reddit/"

