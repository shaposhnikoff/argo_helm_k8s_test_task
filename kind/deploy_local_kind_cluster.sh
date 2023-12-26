#!/bin/bash


#kind="kind"
#kubectl="kubectl --kubeconfig=kind-config"


cat > kind-cluster-3-nodes.yaml <<EOF
---
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
networking:
  podSubnet: "10.244.0.0/16"
kubeadmConfigPatches:
- |
  apiVersion: kubelet.config.k8s.io/v1beta1
  kind: KubeletConfiguration
  evictionHard:
    nodefs.available: "5%"
- |
  kind: InitConfiguration
  nodeRegistration:
    kubeletExtraArgs:
      node-labels: "ingress-ready=true"
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP
nodes:
- role: control-plane
- role: worker
- role: worker
  

EOF

kind delete cluster
kind create cluster --config kind-cluster-3-nodes.yaml
kind get kubeconfig > kind-config
chmod 600 kind-config

kind get kubeconfig > ~/.kube/kind-config
chmod 600 ~/.kube/kind-config
