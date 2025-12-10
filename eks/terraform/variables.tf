variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "k8s-production-cluster"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnets" {
  description = "Private subnet CIDRs (3 recommended, one per AZ)"
  type        = list(string)
  default     = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
}

variable "public_subnets" {
  description = "Public subnet CIDRs (3 recommended)"
  type        = list(string)
  default     = ["10.0.101.0/24","10.0.102.0/24","10.0.103.0/24"]
}

variable "node_groups" {
  description = "Map of managed node groups (instance types, desired/min/max sizes)"
  type = map(object({
    desired_size = number
    min_size     = number
    max_size     = number
    instance_types = list(string)
  }))
  default = {
    default = {
      desired_size  = 2
      min_size      = 2
      max_size      = 4
      instance_types = ["t3.medium"]
    }
  }
}

variable "create_kms_for_sops" {
  description = "Create KMS key for SOPS encryption"
  type        = bool
  default     = true
}
