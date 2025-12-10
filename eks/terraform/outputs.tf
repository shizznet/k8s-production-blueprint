output "cluster_name" {
  value = module.eks.cluster_id
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "kubeconfig_certificate_authority_data" {
  value = module.eks.cluster_certificate_authority_data
}

output "kms_key_arn" {
  value = var.create_kms_for_sops ? aws_kms_key.sops[0].arn : ""
}
