# show deployments and images from all namespaces
function all-deployments-images
  kubectl get deployment --all-namespaces -o json | jq '.items[]|{deployment: .metadata.name, namespace: .metadata.namespace, image: .spec.template.spec.containers[].image}'
end

