# k8s-production-blueprint  
Production-ready Kubernetes blueprint with Kustomize overlays, secure defaults, CI validation, optional security modules, and GitOps-compatible manifests.

This repository provides an extensible structure for deploying applications to Kubernetes following production best practices.  
Optional modules (network policies, ingress/TLS, monitoring) are included for environments that require additional capabilities.

---

## Features

### • Environment-based Kustomize structure
- Shared `base` layer for core Kubernetes objects  
- Isolated dev/prod overlays  
- Clear, minimal patching model  

### • Secure-by-default configuration
- Dedicated namespaces  
- Explicit ServiceAccount identity  
- Resource requests, limits, probes  
- Optional zero-trust NetworkPolicies  

### • Optional ingress & TLS
Located under `k8s/optional/ingress/`:
- NGINX Ingress  
- cert-manager ClusterIssuers  
- TLS Certificate template  

### • Optional monitoring module (Operator or Annotation-based)
Located under `k8s/optional/monitoring/`:

#### **Operator mode**
```
k8s/optional/monitoring/operator/
```
Includes:
- `grafana-dashboard-basic.json`  
- `grafana-dashboard-advanced.json`  
- Compatible with Prometheus Operator  
- Uses cluster-level metrics

#### **Annotation mode**
```
k8s/optional/monitoring/annotations/
```
Includes:
- Patch for Prometheus scrape annotations  
- Basic & advanced dashboards  
- Works with plain Prometheus setups  

Enable by adding to overlay:
```yaml
resources:
  - ../../optional/monitoring/operator
```
or
```yaml
resources:
  - ../../optional/monitoring/annotations
```

### • CI validation
CI checks:
- Kustomize build  
- Kubernetes manifest validation  
- YAML linting  

### • GitOps-ready
Compatible with FluxCD, ArgoCD, Rancher Fleet, and other GitOps controllers.

---

## Directory Structure

```
k8s/
  base/
  apps/
  overlays/
    dev/
    prod/
  optional/
    ingress/
    networkpolicy/
    monitoring/
      operator/
      annotations/
```

---

## Quick Start

Create a cluster:
```bash
./tools/create-kind-cluster.sh
```

Deploy to dev:
```bash
kustomize build k8s/overlays/dev | kubectl apply -f -
```

---

## Optional Modules Overview

### 🔹 NetworkPolicies
Enable strict traffic isolation — optional:
```yaml
resources:
  - ../../optional/networkpolicy
```

### 🔹 Ingress + cert-manager
Enable HTTP routing + TLS — optional:
```yaml
resources:
  - ../../optional/ingress
```

### 🔹 Monitoring (Operator or Annotation-based)
Add dashboards + scrape integration — optional:
```yaml
resources:
  - ../../optional/monitoring/operator
```
or
```yaml
resources:
  - ../../optional/monitoring/annotations
```

---

## Roadmap
- PodSecurity / securityContext  
- PDB definitions  
- GitOps bootstrap configs  
- Secret management integrations (SOPS / SealedSecrets)  
- Extended observability modules  

---

## License
MIT License.  
