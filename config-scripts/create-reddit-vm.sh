#!/usr/bin/env bash

#gcloud compute instances create reddit-app --boot-disk-size=12GB --image-family=reddit-full --image-project=reddit-full-1577299908 --machine-type=g1-small --tags puma-server --restart-on-failure
gcloud compute instances create reddit-app --boot-disk-size=12GB --image-family=reddit-full --machine-type=g1-small --tags puma-server --restart-on-failure
