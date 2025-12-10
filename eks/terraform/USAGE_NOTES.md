## Important operational notes

- This scaffold uses the `terraform-aws-modules/eks/aws` module which will create IAM roles and policies.
- If you are running in an AWS Organization with SCPs/restrictions, ensure permissions are in place for EKS and KMS operations.
- Node group instance types and sizes should reflect your workload needs and budget.
- Review rotation / deletion policy for KMS keys before enabling in production.
