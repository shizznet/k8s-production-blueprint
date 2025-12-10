# Optional NetworkPolicies

This folder contains **optional** NetworkPolicy resources you can enable to harden pod networking for the `myapp` namespace.

These policies are **recommended** for production environments seeking a zero-trust posture, but are **not mandatory**. They are intentionally placed under `k8s/optional/networkpolicy/` so operators can opt-in.

## Files
- deny-all.yaml — Baseline deny for ingress & egress in the namespace.
- allow-app.yaml — Allows app-specific ingress/egress on port 8080 within the namespace.
- allow-dns.yaml — Allows egress for DNS (UDP/TCP 53).
- allow-metrics.yaml — Allows scraping from a labeled monitoring namespace or Prometheus pods.
- allow-egress-internet.yaml — Allows outbound HTTPS (443) to the internet.

## How to enable
Include this optional folder in an overlay's kustomization, for example:

```yaml
resources:
  - ../../optional/networkpolicy
```

Adapt `namespace` fields and selectors to match your production conventions before applying.
