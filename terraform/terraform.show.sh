#!/bin/bash

# find a terraform resource in state by name

terraform show -json|jq '.values.root_module.resources[]|select(.name=="$1")|.values'

