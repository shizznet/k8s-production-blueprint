# k8s-production-blueprint  
Production-ready Kubernetes blueprint with Kustomize overlays, secure defaults, CI validation, optional security modules, and GitOps-compatible manifests.

---

## Why this Kubernetes template exists
This repository serves as a **production-grade Kubernetes template and reference implementation** using:
- Kustomize overlays  
- Optional security modules  
- GitOps workflows  
- CI validation  
- Ingress + TLS  
- Monitoring (Prometheus Operator or annotation-based)  

It is built to be cloned, adapted, and reused for real-world environments.

---

## Features

### • Environment-based Kustomize structure
- Shared `base` layer for core Kubernetes objects  
- Dev/prod overlays with clean patches  
- GitOps-friendly layout  

### • Secure-by-default configuration
- Namespaces per environment  
- Explicit ServiceAccount  
- Resource requests, limits, probes  
- Optional NetworkPolicies (zero-trust ready)  

### • Optional ingress & TLS
Includes:
- NGINX Ingress  
- cert-manager issuers (staging + production)  
- TLS certificate resource  

### • Optional monitoring modules
Located at `k8s/optional/monitoring/`

#### Operator mode (`prometheus-operator`)
- Basic and advanced Grafana dashboards  
- No ServiceMonitor required (app does not expose metrics yet)  

#### Annotation mode (plain Prometheus)
- Deployment patched with `prometheus.io` scrape annotations  
- Same dashboards  

Enable via:
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

## Quick Start

Create cluster:
```bash
./tools/create-kind-cluster.sh
```

Deploy dev:
```bash
kustomize build k8s/overlays/dev | kubectl apply -f -
```

---

## Repo Topics (recommended)
kubernetes, k8s, kustomize, gitops, production, devops, ingress, cert-manager, prometheus, grafana, monitoring, infrastructure

---

## License
MIT License.
