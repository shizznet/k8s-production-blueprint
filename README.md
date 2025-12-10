# k8s-production-blueprint
Production-ready Kubernetes blueprint with Kustomize overlays, secure defaults, CI validation, and GitOps-compatible manifests.

This repository provides a clean, extensible foundation for deploying applications to Kubernetes using industry-standard patterns. The layout is optimized for clarity, security, reusability, and operational consistency across environments.

## Features

### • Environment-based Kustomize structure
- Shared `base` layer for core Kubernetes objects
- `overlays/dev` and `overlays/prod` for environment-specific configuration
- Zero duplication and clean patching model

### • Secure-by-default configuration
- Namespaces, ServiceAccounts, and RBAC
- NetworkPolicies support (optional)
- Externalized secrets (no plaintext secrets committed)
- Resource boundaries, probes, and scalable deployment patterns

### • CI validation
GitHub Actions workflow validates:
- Kustomize builds
- Kubernetes manifest syntax
- Dry-run apply checks

### • GitOps-ready
Manifests integrate seamlessly with:
- FluxCD
- ArgoCD
- Any declarative GitOps controller

### • Local cluster support (kind)
Provision deterministic local clusters for safe testing.

## Directory Structure

```
k8s-production-blueprint/
├─ k8s/
│  ├─ base/
│  ├─ overlays/
│  │  ├─ dev/
│  │  └─ prod/
│  └─ apps/
│     └─ myapp/
├─ .github/workflows/
├─ tools/
├─ docs/
└─ README.md
```

## Quick Start

### Create a local Kubernetes cluster
```bash
./tools/create-kind-cluster.sh
```

### Apply dev environment manifests
```bash
kustomize build k8s/overlays/dev | kubectl apply -f -
```

### Verify
```bash
kubectl get all -n myapp-dev
```

## Roadmap

- Add RBAC refinements
- Add NetworkPolicies
- Add probes across deployments
- Add PodDisruptionBudgets
- Add Ingress + TLS (cert-manager)
- Add GitOps bootstrap configuration
- Add monitoring and logging components
- Add security scanning workflows

## License
MIT License. See `LICENSE` for details.
