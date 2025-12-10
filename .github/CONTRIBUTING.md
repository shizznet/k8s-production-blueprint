# Contributing Guide

## Branch Model
- `main` → stable, production-ready
- `dev` → integration/testing

### Recommended Branch Protections
- Require PR reviews  
- Require CI validation  
- Prevent force pushes  
- Disallow deletion of `main`  
- No plaintext secrets committed  

---

## Commit Requirements

Before pushing:
```bash
kustomize build k8s/overlays/dev | kubectl apply --dry-run=client -f -
```

YAML must pass linting and all secrets must be `.enc.yaml` files.

---

## GitOps Workflow Rules
- All production changes go through PRs  
- FluxCD applies changes automatically  
- Never manually `kubectl apply` to production  
