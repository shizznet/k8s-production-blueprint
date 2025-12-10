# Operational Overview

This document provides operational guidance for deploying and managing the Kubernetes manifests in this repository.

---

## Prerequisites

Install:
```bash
brew install kubectl
brew install kustomize
brew install kind
```

Recommended:
- k9s  
- stern  
- kubectx / kubens  

---

## Local Cluster Setup

```bash
./tools/create-kind-cluster.sh
kubectl get nodes
```

---

## Deployment Workflow

Dev:
```bash
kustomize build k8s/overlays/dev | kubectl apply -f -
```

Prod:
```bash
kustomize build k8s/overlays/prod | kubectl apply -f -
```

Remove:
```bash
kustomize build k8s/overlays/dev | kubectl delete -f -
```

---

## Optional Modules

### 🔹 NetworkPolicies
Located under:
```
k8s/optional/networkpolicy/
```

Enable:
```yaml
resources:
  - ../../optional/networkpolicy
```

### 🔹 Ingress & TLS (NGINX + cert-manager)
Located under:
```
k8s/optional/ingress/
```

Enable:
```yaml
resources:
  - ../../optional/ingress
```

Ensure:
- NGINX ingress controller installed  
- cert-manager installed  
- DNS updated  

### 🔹 Monitoring (Operator or Annotation-based)
Located under:
```
k8s/optional/monitoring/
```

#### Operator mode:
For clusters with Prometheus Operator.  
Includes:
- basic and advanced dashboards  

Enable:
```yaml
resources:
  - ../../optional/monitoring/operator
```

#### Annotation mode:
For plain Prometheus.  
Patches deployment with scrape annotations.

Enable:
```yaml
resources:
  - ../../optional/monitoring/annotations
```

---

## Secret Management

Create secrets:
```bash
kubectl create secret generic myapp-secret   --from-literal=DATABASE_URL="postgres://..."   -n myapp-dev
```

---

## CI Integration

CI enforces:
- Kustomize build success  
- kubectl dry-run validation  
- YAML linting  

---

## Troubleshooting

Pod logs:
```bash
kubectl logs deployment/myapp -n myapp-dev
```

Validate manifest:
```bash
kubectl apply --dry-run=client -f file.yaml
```

Kustomize errors:
Verify entries in `kustomization.yaml`.

---
