<p align="center">
  <img src="./banner.png" width="100%" />
</p>

# k8s-production-blueprint

[![CI](https://github.com/shizznet/k8s-production-blueprint/actions/workflows/validate-manifests.yaml/badge.svg)](https://github.com/shizznet/k8s-production-blueprint/actions/workflows/validate-manifests.yaml)

Production-ready Kubernetes blueprint with:
- Kustomize overlays  
- FluxCD GitOps  
- SOPS + AWS KMS secret encryption  
- Optional modules (Ingress, NLB, NetworkPolicy, Monitoring)  
- Terraform EKS bootstrap  

---

# 🚀 Quick Start (Full Production Flow)

## 1. Create EKS cluster
```bash
cd eks/terraform
terraform init
terraform apply
```

Export kubeconfig:
```bash
aws eks update-kubeconfig --region ap-south-1 --name k8s-production-cluster
```

## 2. Bootstrap Flux (GitOps)
```bash
flux bootstrap github   --owner=shizznet   --repository=k8s-production-blueprint   --branch=main   --path=gitops/flux/flux-system
```

## 3. Encrypt Secrets
```bash
./tools/encrypt-secret.sh k8s/secrets/appsecret.template.yaml k8s/secrets/appsecret.enc.yaml
```

## 4. Deploy workloads
### Production:
```bash
kustomize build k8s/overlays/prod | kubectl apply -f -
```
### Development:
```bash
kustomize build k8s/overlays/dev | kubectl apply -f -
```

---
