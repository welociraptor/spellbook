#!/bin/bash

# create a n1-standard-1 instance with one local ssd

gcloud compute instances create demo-db \
  --local-ssd=interface=nvme \
  --maintenance-policy=terminate \
  --network=mf-dev-vpc \
  --subnet=mf-dev-subnet-public \
  --tags=allow-postgres,allow-ssh \
  --zone=europe-west4-a \
  --image-family=ubuntu-1804-lts \
  --image-project=ubuntu-os-cloud

