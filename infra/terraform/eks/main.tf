module "eks" {
source = "terraform-aws-modules/eks/aws"
version = "~> 20.0"


cluster_name = "prod-eks"
cluster_version = "1.29"


vpc_id = module.vpc.vpc_id
subnet_ids = module.vpc.private_subnets


enable_irsa = true


eks_managed_node_groups = {
system = {
instance_types = ["t3.medium"]
min_size = 2
max_size = 4
desired_size = 2
labels = { role = "system" }
taints = [{ key = "CriticalAddonsOnly", value = "true", effect = "NO_SCHEDULE" }]
}
}


tags = { Project = "prod-devops" }
}
