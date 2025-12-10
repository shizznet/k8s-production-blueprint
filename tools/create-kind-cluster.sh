#!/usr/bin/env bash
set -euo pipefail

CLUSTER_NAME="${1:-k8s-blueprint-dev}"

cat <<EOF | kind create cluster --name "${CLUSTER_NAME}" --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
  - role: control-plane
    labels:
      topology.kubernetes.io/zone: zone-a
    extraPortMappings:
      - containerPort: 80
        hostPort: 8080
      - containerPort: 443
        hostPort: 8443
  - role: worker
    labels:
      topology.kubernetes.io/zone: zone-a
  - role: worker
    labels:
      topology.kubernetes.io/zone: zone-b
networking:
  disableDefaultCNI: false
  kubeProxyMode: "iptables"
EOF

echo "Cluster '${CLUSTER_NAME}' created successfully."
echo "Deploy nginx ingress controller:"
echo "kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml"

echo "Use: kubectl cluster-info --context kind-${CLUSTER_NAME}"
