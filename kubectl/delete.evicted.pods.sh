#!/bin/bash

# delete evicted pods

kubectl get pods -o json |jq -r '.items[]|select(.status.reason=="Evicted")|.metadata.name'|xargs kubectl delete pod
