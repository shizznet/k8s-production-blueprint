############################
# VPC: terraform-aws-modules/vpc/aws
############################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name = "${var.cluster_name}-vpc"
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zones.available.names
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = true
  single_nat_gateway = false

  tags = {
    "Name" = "${var.cluster_name}-vpc"
    "project" = var.cluster_name
  }
}

############################
# EKS cluster (terraform-aws-modules/eks/aws)
############################

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.27"
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  # Control plane logging
  cluster_enabled_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  manage_aws_auth = true

  node_groups = local.node_groups_map

  tags = {
    "Project" = var.cluster_name
  }
}

############################
# Data sources for EKS provider
############################

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
  depends_on = [module.eks]
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
