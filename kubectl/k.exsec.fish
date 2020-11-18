# decode an entry in a secret
function k.exsec
  kubectl get secret $argv[1] -o json | jq -r ".data.$argv[2]" | base64 --decode 
end
