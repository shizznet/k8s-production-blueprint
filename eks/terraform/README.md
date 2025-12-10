# Terraform EKS Bootstrap Module (example)

This Terraform scaffold provisions:

- VPC with public & private subnets (terraform-aws-modules/vpc/aws)
- EKS cluster (terraform-aws-modules/eks/aws)
- Managed Node Groups
- Optional KMS key for SOPS secrets

> This is an example starter configuration. Review, tweak sizes, versions, and policies before using in production.

## Quick start

1. Install Terraform (>= 1.2)
2. Configure AWS credentials (`aws configure` or environment variables)
3. Initialize and plan:

```bash
terraform init
terraform plan -var="region=ap-south-1" -var="cluster_name=my-prod-cluster"
```

4. Apply:

```bash
terraform apply -var="region=ap-south-1" -var="cluster_name=my-prod-cluster"
```

## Notes

- The module uses community modules (VPC & EKS). Review the module versions and inputs.
- A KMS key is created by default for SOPS; set `create_kms_for_sops = false` if you will reuse an existing key.
- After provisioning, you can bootstrap Flux using the `gitops/flux` manifests in the repo.
