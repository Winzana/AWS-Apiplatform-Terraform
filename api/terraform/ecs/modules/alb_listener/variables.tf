variable "service_name" {
  description = "Name of service"
}

variable "container_port" {
  description = "Port that service will listen on"
}

variable "vpc_id" {
  description = "Id of the VPC where service should be deployed"
}

variable "alb_dns_name" {
  description = "Alb dns name"
}

variable "instance_alb_arn" {
  description = "ARN of alb instance"
}

variable "alb_zone_id" {
  description = "Id of alb zone"
}
variable "route53_zone_id" {
  description = "Route53 zone id"
}
variable "base_url" {
  description = "base url"
}
