module "alb_listener" {
    source = "./modules/alb_listener"

    instance_alb_arn = data.terraform_remote_state.base_remote_state.outputs.instance_alb_arn
    alb_zone_id = data.terraform_remote_state.base_remote_state.outputs.alb_zone_id
    alb_dns_name = data.terraform_remote_state.base_remote_state.outputs.alb_dns_name
    base_url = var.base_url
    container_port = var.container_port_nginx
    route53_zone_id = data.terraform_remote_state.base_remote_state.outputs.route53_zone_id
    service_name = var.service_name
    vpc_id = data.terraform_remote_state.base_remote_state.outputs.vpc_id
}

module "ecs_service" {
    source = "./modules/ecs"

    base_url = var.base_url
    service_name = var.service_name
    service_nginx_name = var.service_nginx_name
    service_php_name = var.service_php_name
    docker_image_fpm = var.docker_image_fpm
    docker_image_nginx = var.docker_image_nginx
    docker_tag = var.docker_tag
    container_cpu = var.container_cpu
    container_memory = var.container_memory
    container_port_nginx = var.container_port_nginx
    container_port_php = var.container_port_php
    region = var.region
    cluster_name = data.terraform_remote_state.base_remote_state.outputs.ecs_cluster_name
    desired_count = var.min_capacity
    ecs_service_role_arn = data.terraform_remote_state.base_remote_state.outputs.ecs_service_role_arn
    target_group_arn = module.alb_listener.target_group_arn
    fargate_role_arn = data.terraform_remote_state.base_remote_state.outputs.fargate_role_arn
    security_group_internal_id = data.terraform_remote_state.base_remote_state.outputs.security_group_internal_id
    subnet_private_ids = data.terraform_remote_state.base_remote_state.outputs.subnet_private_ids

    APP_ENV = var.APP_ENV
    APP_SECRET = var.APP_SECRET

}
