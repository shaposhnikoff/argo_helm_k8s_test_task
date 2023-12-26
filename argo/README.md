### install ArgoCD with HELM
```
helm --kubeconfig '../kind/kind-config' repo add argo https://argoproj.github.io/argo-helm

helm repo update

kubectl --kubeconfig '../kind/kind-config' get ns

helm template --kubeconfig '../kind/kind-config' -f argo-values/values_kind.yaml --namespace argo-cd argo-cd argo/argo-cd > template.argo

helm upgrade --install --kubeconfig '../kind/kind-config' --create-namespace -f argo-values/values_kind.yaml --namespace argo-cd argo-cd argo/argo-cd

kubectl --kubeconfig '../kind/kind-config' -n argo-cd apply -f argo-values/example_app.yml
```

