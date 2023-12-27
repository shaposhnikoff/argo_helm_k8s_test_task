
kubectl --kubeconfig="../kind/kind-config" port-forward --address 0.0.0.0 \
                      -n argo-cd service/argo-cd-argocd-server 8888:80

