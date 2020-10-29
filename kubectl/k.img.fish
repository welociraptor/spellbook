# get image name for deployment
function k.img
  kubectl get deployment $argv -o jsonpath={..image}
end
