# Optional Ingress + TLS (NGINX) Module

This folder contains optional manifests for exposing `myapp` via an NGINX Ingress and managing TLS certificates with cert-manager.

**Status:** Optional — include in overlays when you want managed TLS and HTTP routing.

## Files
- `ingress.yaml` — Ingress resource for `myapp` (uses nginx ingress class and redirects HTTP→HTTPS).
- `clusterissuer-staging.yaml` — cert-manager ClusterIssuer for Let's Encrypt staging (safe for testing).
- `clusterissuer-prod.yaml` — cert-manager ClusterIssuer for Let's Encrypt production.
- `certificate.yaml` — cert-manager Certificate to request a cert for `myapp.example.com`.
- `kustomization.yaml` — aggregator for all optional ingress resources.

## How to enable
1. Install cert-manager in the cluster (https://cert-manager.io/docs/installation/).
2. Ensure an NGINX Ingress Controller is installed and the ingress class is `nginx`.
3. Update email addresses and DNS names inside issuer/certificate manifests.
4. In your overlay kustomization, include this optional folder:
```yaml
resources:
  - ../../optional/ingress
```

## Notes
- `clusterissuer-staging` uses Let's Encrypt staging endpoint — use it for testing to avoid rate limits.
- Replace `myapp.example.com` with your real domain and ensure DNS points to your ingress controller.
- The ingress uses annotation `cert-manager.io/cluster-issuer: "letsencrypt-staging"`. For production, switch to `letsencrypt-prod`.
