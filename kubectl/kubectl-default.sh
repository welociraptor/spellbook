#!/bin/bash
if [ "$1" != "namespace" ]; then exit 0; fi;

kubectl config set-context --current --namespace=$2

