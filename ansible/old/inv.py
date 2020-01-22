#!/usr/bin/env python3

import os

data_app = os.popen("""gcloud compute instances list | grep app""").read().split()
data_db = os.popen("""gcloud compute instances list | grep db""").read().split()


#print(data_app[4])
#print(data_db[4])

json = {
    "app": {
        "hosts": ["appserver"],
        "vars": {
            "ansible_host": data_app[4]
        }
    },
    "db": {
        "hosts": ["dbserver"],
        "vars": {
            "ansible_host": data_db[4]
        }
    }
}

print(json)