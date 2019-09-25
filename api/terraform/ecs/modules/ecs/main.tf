### ECS
resource "aws_cloudwatch_log_group" "ecs_service_lg" {
  name                                = "${replace(terraform.workspace, "/(.{0,15})(.*)/", "$1")}-${var.service_name}-ecs"
  retention_in_days                   = 1
}

data "template_file" "task_definition" {
  template                            = file("${path.module}/templates/ecs/apiplatform-api.json")

  vars = {
    base_url                          = var.base_url
    service_nginx_name                = var.service_nginx_name
    service_php_name                  = var.service_php_name
    docker_image_nginx                = var.docker_image_nginx
    docker_image_fpm                  = var.docker_image_fpm
    docker_tag                        = var.docker_tag
    container_port_nginx              = var.container_port_nginx
    container_port_php                = var.container_port_php
    environment                       = terraform.workspace
    log_group_name                    = aws_cloudwatch_log_group.ecs_service_lg.name
    log_group_region                  = var.region

    APP_ENV                           = var.APP_ENV
    APP_SECRET                        = var.APP_SECRET
  }
}

resource "aws_ecs_task_definition" "ecs_service" {
  family                              = "${replace(terraform.workspace, "/(.{0,15})(.*)/", "$1")}-${var.service_name}"
  cpu                                 = var.container_cpu
  memory                              = var.container_memory
  container_definitions               = data.template_file.task_definition.rendered
  execution_role_arn                  = var.fargate_role_arn

  requires_compatibilities            = ["FARGATE"]
  network_mode                        = "awsvpc"
}

resource "aws_ecs_service" "ecs_service" {
  name                                = "${replace(terraform.workspace, "/(.{0,15})(.*)/", "$1")}-${var.service_name}"
  cluster                             = var.cluster_name
  task_definition                     = aws_ecs_task_definition.ecs_service.arn
  desired_count                       = var.desired_count
  deployment_minimum_healthy_percent  = 50
  deployment_maximum_percent          = 150
  launch_type                         = "FARGATE"

  network_configuration {
    subnets                           = var.subnet_private_ids
    security_groups                   = [var.security_group_internal_id]
  }

  load_balancer {
    target_group_arn                  = var.target_group_arn
    container_name                    = var.service_nginx_name
    container_port                    = var.container_port_nginx
  }
}
