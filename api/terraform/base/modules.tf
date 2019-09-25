module "vpc" {
  source = "./modules/vpc"
  region = var.region
  az_count = var.az_count
}

module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
  vpc_cidr_block = module.vpc.vpc_cidr_block
  CIDR_PRIVATE = var.CIDR_PRIVATE
  CIDR_PUBLIC = var.CIDR_PUBLIC
}

module "alb" {
  source = "./modules/alb"
  security_group_internal_id = module.security.internal_id
  security_group_inbound_id = module.security.inbound_id
  alb_subnet_ids = module.vpc.subnet_public_ids
  vpc_id = module.vpc.vpc_id
  acm_arn = var.acm_arn
  base_url = var.base_url
}

module "ecs" {
  source = "./modules/ecs"
}
