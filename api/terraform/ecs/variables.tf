variable "region" {
  description = "AWS region to deploy to (e.g. ap-southeast-2)"
  default = "eu-west-1"
}

variable "profile" {
  description = "AWS profile."
  default = "apiplatform-api"
}

variable "base_url" {
  description = "Base url to deploie infra."
}

variable "service_name" {
  description = "Name of service"
  default     = "apiplatform"
}

variable "service_nginx_name" {
  description = "Name of service"
  default     = "nginx"
}

variable "service_php_name" {
  description = "Fpm name of service"
  default     = "php"
}

variable "container_port_nginx" {
  description = "Port that service will listen on nginx"
  default     = 80
}


variable "container_port_php" {
  description = "Port that service will listen on fpm"
  default     = 9000
}

variable "docker_image_nginx" {
  description = "Docker image to run nginx"
}

variable "docker_image_fpm" {
  description = "Docker image to run fpm"
}

variable "docker_tag" {
  description = "Tag of docker image to run"
}

variable "container_cpu" {
  description = "The number of cpu units to reserve for the container. See https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html"
  default     = "2048"
}

variable "container_memory" {
  description = "The number of MiB of memory to reserve for the container. See https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html"
  default     = "4096"
}

variable "min_capacity" {
  description = "Minimum number of containers to run"
  default     = 1
}

variable "max_capacity" {
  description = "Minimum number of containers to run"
  default     = 5
}

variable "APP_ENV" {
  description = "APP_ENV"
}

variable "APP_SECRET" {
  description = "APP_SECRET"
}
