#!/bin/bash

# decode an entry in a secret
kubectl get secret $1 -o json | jq -r ".data.$2" | base64 --decode 
