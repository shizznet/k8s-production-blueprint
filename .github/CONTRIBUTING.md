# Contributing Guide

## Branch Strategy
- `main` → stable
- `dev` → integration/testing

### Branch protection
- Require PR reviews
- Require CI workflow to pass
- Prevent force pushes
- No plaintext secrets

## Commit Rules
Must pass:
```bash
kustomize build k8s/overlays/dev | kubectl apply --dry-run=client -f -
```

## GitOps Rules
- All production changes go through PRs
- FluxCD applies them automatically
