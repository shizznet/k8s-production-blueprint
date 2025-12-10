locals {
  # Map node_groups variable into node_groups input for the module
  node_groups_map = tomap({
    for name, ng in var.node_groups :
    name => {
      desired_capacity = ng.desired_size
      min_size         = ng.min_size
      max_size         = ng.max_size
      instance_types   = ng.instance_types
      # Default tags for node group
      tags = {
        Name = "${var.cluster_name}-${name}"
      }
    }
  })
}
