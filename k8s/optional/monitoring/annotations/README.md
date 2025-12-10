# Optional Monitoring (Annotations) Module

This module patches the `myapp` Deployment to include Prometheus scrape annotations so plain Prometheus (non-Operator) can pick up the target.

Files:
- monitoring-annotations-patch.yaml — adds prometheus.io annotations to the deployment
- grafana-dashboard-myapp.json — dashboards to import into Grafana

How to enable:
- Add the annotations overlay to your overlay kustomization:
  resources:
    - ../../optional/monitoring/annotations

Caveats:
- This only enables scraping if Prometheus is configured to respect `prometheus.io` annotations.
- If your cluster uses Prometheus Operator, prefer the operator module and ServiceMonitor/PodMonitor resources instead.
