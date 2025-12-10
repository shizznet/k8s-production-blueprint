# k8s-production-blueprint  
**Production-ready Kubernetes blueprint with Kustomize overlays, secure defaults, CI validation, and GitOps-friendly manifests.**

This repository is a **clean, extensible, production-focused Kubernetes starter kit** designed to help you:
- learn Kubernetes the right way (layered, secure, declarative)
- deploy real-world applications with confidence
- adopt best practices for scaling, networking, security, and GitOps
- maintain a clean, future-proof directory structure instead of YAML sprawl

Whether you're building your first production cluster or refining your DevOps workflow, this blueprint gives you a solid foundation.

---

## ✨ Features

### ✔ **Production-ready Kustomize structure**
- Separation of `base` and environment-specific overlays (`dev`, `prod`)
- Zero duplication, clean layering, easy to extend
- Clear dependency ordering (Namespace → Config → RBAC → Service → Deployment → Ingress → HPA)

### ✔ **Secure-by-default manifests**
- Namespaces for isolation  
- ServiceAccounts and RBAC roles  
- NetworkPolicies (optional)  
- No plaintext secrets committed  

### ✔ **GitHub Actions CI**
- Validates Kubernetes manifests
- Runs `kustomize build` on each PR
- Dry-run apply to catch errors before deployment
- Ready for expansion into full CI/CD pipelines

### ✔ **GitOps-friendly**
All manifests are declarative and structured for easy adoption with:
- FluxCD
- ArgoCD
- Rancher Fleet

### ✔ **Local development with kind**
Includes scripts to spin up a reproducible local cluster on your laptop.

---

## 📂 Directory Structure

```
k8s-production-blueprint/
├─ k8s/
│  ├─ base/                # Core manifests shared across all environments
│  ├─ overlays/
│  │  ├─ dev/              # Development configuration
│  │  └─ prod/             # Production configuration
│  └─ apps/
│     └─ myapp/            # Example application (Deployment, Service, HPA, PVC)
├─ .github/
│  └─ workflows/           # CI validation workflows
├─ tools/                  # Helper scripts (e.g., create-kind-cluster)
├─ docs/                   # Learning notes, guides, architecture diagrams
└─ README.md
```

---

## 🚀 Getting Started

### 1️⃣ Clone the repository
```bash
git clone https://github.com/<your-username>/k8s-production-blueprint.git
cd k8s-production-blueprint
```

### 2️⃣ Create a local Kubernetes cluster using kind
```bash
./tools/create-kind-cluster.sh
```

### 3️⃣ Deploy the sample app to the dev environment
```bash
kustomize build k8s/overlays/dev | kubectl apply -f -
```

### 4️⃣ Verify
```bash
kubectl get pods -n myapp-dev
kubectl get svc -n myapp-dev
```

---

## 🧠 What You'll Learn (by following the commits)

This project is intentionally built to teach you **how production Kubernetes is done**:

- structuring manifests the right way  
- layering environments with Kustomize  
- RBAC, security, and least-privilege access  
- managing secrets securely  
- health probes, resource limits, autoscaling  
- ingress & TLS  
- CI validation  
- GitOps workflows  
- scaling and operational best practices  

Every pull request adds a new production concept in a clean, incremental way.

---

## 📌 Roadmap

- [ ] Add full ConfigMap + Secret workflow (sealed secrets or sops)
- [ ] Add RBAC roles + bindings
- [ ] Add NetworkPolicies
- [ ] Add liveness/readiness probes
- [ ] Add PodDisruptionBudget
- [ ] Add ingress + TLS (cert-manager)
- [ ] Add GitOps bootstrap (Flux or ArgoCD)
- [ ] Add monitoring stack (Prometheus + Grafana)
- [ ] Add logging stack (Loki or EFK)
- [ ] Add image scanning (Trivy) in CI
- [ ] Add policy-as-code checks (Conftest / Gatekeeper)

Open to contributions as the blueprint evolves.

---

## 📄 License
This project is licensed under the **MIT License**.  
See `LICENSE` for details.

---

## ⭐ Support & Contributions

If this project helps you:

🌟 **Star the repo** — it motivates further development  
📥 **Open issues** for improvements  
🔀 **Submit PRs** — contributions are welcome  

---

## 🙌 Acknowledgements

Inspired by real-world production Kubernetes patterns used across modern DevOps teams, GitOps platforms, and cloud-native infrastructure.
