variable "az_count" {
  description = "Number of AZs to cover in a given AWS region"
  default = 2
}

variable "base_url" {
  description = "Base url to deploie infra."
}

variable "service_name" {
  description = "Name of service"
}

variable "service_nginx_name" {
  description = "Name of service"
  default     = "nginx"
}

variable "service_php_name" {
  description = "Fpm name of service"
  default     = "php"
}

variable "docker_image_fpm" {
  description = "Docker image to run in the ECS cluster"
}

variable "docker_image_nginx" {
  description = "Docker image to run in the ECS cluster"
}

variable "container_port_nginx" {
  description = "Port exposed by the docker image to redirect traffic to"
  default = 80
}

variable "container_port_php" {
  description = "Port exposed by the docker image to redirect traffic to"
  default = 9000
}

variable "app_count" {
  description = "Number of docker containers to run"
  default = 2
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default = "256"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default = "512"
}

variable "docker_tag" {
  description = "Docker image version"
  type = "string"
}

variable "container_cpu" {
  description = "The number of cpu units to reserve for the container. See https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html"
}

variable "container_memory" {
  description = "The number of MiB of memory to reserve for the container. See https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html"
}

variable "region" {
  description = "AWS region to deploy to (e.g. ap-southeast-2)"
}

variable "cluster_name" {
  description = "Name of ECS cluster"
}

variable "desired_count" {
  description = "Initial number of containers to run"
}

variable "ecs_service_role_arn" {
  description = "ARN of IAM role for ECS service"
}

variable "target_group_arn" {
  description = "ARN of ALB target group for service"
}

variable "fargate_role_arn" {
  description = "ARN of IAM role for Fargate"
}

variable "security_group_internal_id" {
  description = "Id of security group allowing internal traffic"
}

variable "subnet_private_ids" {
  description = "Ids of the private subnets"
}

variable "APP_ENV" {
  description = "APP_ENV"
}

variable "APP_SECRET" {
  description = "APP_SECRET"
}
