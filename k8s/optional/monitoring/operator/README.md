# Optional Monitoring (Operator) Module

This optional module provides Grafana dashboards tailored for the `myapp` deployment and Pod/cluster level metrics.
**Note:** This module assumes a cluster-wide Prometheus (Operator) and Grafana are already installed.

What is included:
- grafana-dashboard-basic.json: simple dashboard using cluster-exported metrics (CPU, memory, pod restarts)
- grafana-dashboard-advanced.json: advanced dashboard (latency panels omitted if app metrics not available) focusing on pod-level resource and HPA behavior

How to enable:
1. Ensure Prometheus Operator and Grafana are installed in the cluster.
2. Copy the dashboard JSON into Grafana (via provisioning or the UI).
3. Optionally enable ServiceMonitor/PodMonitor if your app exposes `/metrics`.

This module purposefully **does not** create ServiceMonitor since the application currently does not expose Prometheus metrics.
