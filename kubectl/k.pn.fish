# get only pod names for use with xargs
function k.pn
  kubectl get pods --no-headers -o custom-columns=":metadata.name" $argv
end

