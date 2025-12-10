# Onboarding Guide

Welcome to **k8s-production-blueprint** — a production-ready Kubernetes learning and deployment scaffold.

This guide walks you through:
- how the repo is structured  
- how to use it for local development  
- how to apply manifests safely  
- how to incrementally learn production Kubernetes concepts  
- how to contribute using a step-by-step workflow  

---

# 1. Prerequisites

Install the following tools:

## Kubernetes CLI
```bash
brew install kubectl
```

## Kustomize
```bash
brew install kustomize
```

## kind (Kubernetes in Docker)
```bash
brew install kind
```

## Optional but recommended
- **k9s** for cluster navigation  
- **stern** for log tailing  
- **kubectx + kubens** for context switching  

---

# 2. Repo Overview

```
k8s/
  base/           # Core manifests
  overlays/dev/   # Development environment
  overlays/prod/  # Production environment
  apps/           # Application deployments

.github/workflows # CI validation
tools/            # Scripts (kind setup, helpers)
docs/             # Documentation, guides, patterns
```

This structure mirrors real production repo layouts used by DevOps and platform engineering teams.

---

# 3. Spin up a Local Kubernetes Cluster (kind)

Run:
```bash
./tools/create-kind-cluster.sh
```

Verify:
```bash
kubectl get nodes
```

---

# 4. Deploy to the Dev Environment

Use Kustomize overlays to build and apply manifests:

```bash
kustomize build k8s/overlays/dev | kubectl apply -f -
```

Check the resources:
```bash
kubectl get all -n myapp-dev
```

To delete:
```bash
kustomize build k8s/overlays/dev | kubectl delete -f -
```

---

# 5. Understanding the Manifest Order

This repo follows the correct dependency workflow:

1. Namespace  
2. Secrets  
3. ConfigMaps  
4. ServiceAccount / RBAC  
5. PVC  
6. Service  
7. Deployment / StatefulSet  
8. Ingress  
9. Autoscaling (HPA)  

This order is the backbone of production Kubernetes deployments.

---

# 6. Working with Secrets (Important)

Never commit plaintext secrets.

We use:
- file templates (`secret.template.yaml`)
- secrets provided via CLI at deployment time
- support for sealed-secrets or sops added later

To create a secret locally:
```bash
kubectl create secret generic myapp-secret   --from-literal=DATABASE_URL="postgres://user:pass@db:5432/mydb"   -n myapp-dev
```

---

# 7. CI Validation Workflow

Every PR triggers:
- Kustomize build  
- Kubernetes dry-run apply  
- YAML validation  

This ensures:
- No broken manifests get merged  
- Everything is always deployable  

CI config lives here:
```
.github/workflows/validate-manifests.yaml
```

---

# 8. Roadmap for Learning (Commit by Commit)

Each future commit introduces a production concept:

- RBAC & ServiceAccounts  
- NetworkPolicies  
- Liveness & Readiness probes  
- Resource requests/limits  
- PodDisruptionBudget  
- Ingress + TLS (cert-manager)  
- Autoscaling (HPA)  
- GitOps (Flux or ArgoCD)  
- Observability stack  
- Logging stack  
- Policy-as-code (Gatekeeper/Conftest)

Treat each commit as a learning checkpoint.

---

# 9. Contribution Workflow

1. Create a feature branch  
2. Add or modify manifests  
3. Run validation locally:  
```bash
kustomize build k8s/overlays/dev | kubectl apply --dry-run=client -f -
```
4. Commit changes  
5. Open a PR  
6. Ensure CI passes  

---

# 10. Troubleshooting

### Pod not starting?
Check logs:
```bash
kubectl logs deployment/myapp -n myapp-dev
```

### Image pull errors?
Use:
```bash
kubectl describe pod <pod-name>
```

### YAML issues?
Use:
```bash
kubectl apply --dry-run=client -f <file.yaml>
```

### Kustomize build failing?
Ensure files are referenced in `kustomization.yaml`.

---

# 11. Next Steps

Explore:
- modifying Deployment replicas
- adding resource limits
- adding probes
- creating additional apps under `apps/`
- deploying to prod overlay

---

Happy building 🚀  
This repo is intentionally crafted to teach you real-world Kubernetes patterns.  
