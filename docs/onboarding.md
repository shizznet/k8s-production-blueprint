# Operational Overview

This document provides the operational details required to work with the manifests and environment structure used in this repository.

## Prerequisites

Install:
```bash
brew install kubectl
brew install kustomize
brew install kind
```

Optional utilities:
- k9s
- stern
- kubectx / kubens

## Local Environment Setup

### Create a local cluster
```bash
./tools/create-kind-cluster.sh
```

### Check cluster status
```bash
kubectl get nodes
```

## Deployment Workflow

### Dev environment
```bash
kustomize build k8s/overlays/dev | kubectl apply -f -
```

### Production environment
```bash
kustomize build k8s/overlays/prod | kubectl apply -f -
```

### Remove resources
```bash
kustomize build k8s/overlays/dev | kubectl delete -f -
```

## Manifest Dependency Order

1. Namespace
2. Secrets (externalized)
3. ConfigMaps
4. ServiceAccount & RBAC
5. PVC / Storage
6. Services
7. Deployments / StatefulSets
8. Ingress / TLS
9. Autoscaling

## Secret Management

Secrets are externalized and never committed.

Create secrets locally:
```bash
kubectl create secret generic myapp-secret   --from-literal=DATABASE_URL="postgres://..."   -n myapp-dev
```

## CI Integration

The GitHub Actions workflow validates:
- Kustomize builds
- Kubernetes dry-run apply

Ensures all changes remain deployable and consistent.

## Contribution Workflow

1. Create a feature branch
2. Modify or add manifests
3. Validate:
```bash
kustomize build k8s/overlays/dev | kubectl apply --dry-run=client -f -
```
4. Commit + PR
5. Ensure CI passes

## Troubleshooting

### Pod startup issues
```bash
kubectl logs deployment/myapp -n myapp-dev
```

### YAML issues
```bash
kubectl apply --dry-run=client -f <file>
```

### Kustomize errors
Ensure correct references inside `kustomization.yaml`.
