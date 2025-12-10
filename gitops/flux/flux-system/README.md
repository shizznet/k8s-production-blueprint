# Flux GitOps manifests (example)

These manifests are example Flux `GitRepository` and `Kustomization` resources that instruct Flux to reconcile
the `dev` and `prod` overlays of this repository.

They assume:
- Flux controllers are installed in the cluster (fluxcd v2)
- A Secret named `flux-system` exists for repository access if the repo is private
- You will bootstrap Flux using `flux bootstrap github` (recommended)

**Placeholders**
- Git repository URL: https://github.com/<your-username>/k8s-production-blueprint.git

## Quick bootstrap (recommended)

Install the Flux CLI: https://fluxcd.io/docs/installation/

Then run (interactive):

```bash
flux bootstrap github   --owner=<your-username>   --repository=<repo-name>   --branch=main   --path=./gitops/flux/flux-system   --personal
```

This will:
- Install Flux controllers into the cluster
- Create the GitRepository and Kustomization in the cluster (or reconcile these manifests)
- Start continuous reconciliation of `k8s/overlays/dev` and `k8s/overlays/prod`

## Manual apply (if you installed Flux using another method)

Apply the GitRepository and Kustomization resources:

```bash
kubectl apply -f gitrepository.yaml -n flux-system
kubectl apply -f kustomization-dev.yaml -n flux-system
kubectl apply -f kustomization-prod.yaml -n flux-system
```

