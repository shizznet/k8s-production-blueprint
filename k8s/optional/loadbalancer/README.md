# AWS LoadBalancer (NLB) Module

This optional module creates a Service of type LoadBalancer annotated for AWS Network Load Balancer (NLB).
It is intended to be used when you manage an ingress controller in-cluster (e.g., ingress-nginx) and want to expose it via an AWS NLB.

File: aws-nlb.yaml

Notes:
- Namespace must match the namespace where your ingress controller is deployed (default: ingress-nginx).
- For internal load balancer, change `service.beta.kubernetes.io/aws-load-balancer-scheme` to `internal`.
- For TLS termination at the load balancer, consider using ACM and the `service.beta.kubernetes.io/aws-load-balancer-ssl-cert` annotation.
- This module does NOT install the ingress controller itself; it only exposes it via NLB.
