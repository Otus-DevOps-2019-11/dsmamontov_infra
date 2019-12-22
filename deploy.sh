#!/usr/bin/env bash

runuser -l "ubuntu" -c "git clone -b monolith https://github.com/express42/reddit.git /home/ubuntu/reddit"
runuser -l "ubuntu" -c "cd ~ubuntu/reddit && bundle install"
runuser -l "ubuntu" -c "puma -d --dir /home/ubuntu/reddit/"