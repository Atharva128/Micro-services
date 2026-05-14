module "vpc" {
  source                    = "../../modules/vpc"
  vpc_cidr_block            = var.vpc_cidr_block
  public_subnet_cidr_block  = var.public_subnet_cidr_block
  private_subnet_cidr_block = var.private_subnet_cidr_block
  db_subnet_cidr_block      = var.db_subnet_cidr_block
  project_name              = var.project_name
  env                       = var.env
}

module "eks" {
  source             = "../../modules/eks"
  cluster_name       = var.cluster_name
  kubernetes_version = var.kubernetes_version
  project_name       = var.project_name
  env                = var.env
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
}