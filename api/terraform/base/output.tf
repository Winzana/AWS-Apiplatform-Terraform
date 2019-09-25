output "vpc_id" {
  value = module.vpc.vpc_id
}
output "security_group_internal_id" {
  value = module.security.internal_id
}
output "subnet_private_ids" {
  value = module.vpc.subnet_private_ids
}
output "ecs_cluster_name" {
  value = module.ecs.aws_ecs_cluster_main_id
}
output "ecs_service_role_arn" {
  value = module.security.ecs_service_role_arn
}
output "fargate_role_arn" {
  value = module.security.fargate_role_arn
}
output "route53_zone_id" {
  value = module.alb.route53_zone_id
}

output "instance_alb_arn" {
  value = module.alb.instance_alb_arn
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "alb_zone_id" {
  value = module.alb.alb_zone_id
}
