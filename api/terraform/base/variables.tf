variable "region" {
  description = "AWS region to deploy to (e.g: eu-west-1)"
  default = "eu-west-1"
}

variable "profile" {
  description = "Environment name to deploy to (e.g: prod)"
}

variable "base_url" {
  description = "Base url to deploie infra."
}

variable "acm_arn" {
  description = "ARN of ACM SSL certificate"
}

variable "az_count" {
  description = "Number of AZs to cover in a given AWS region"
  default = "1"
}

variable "CIDR_PRIVATE" {
  default = ["10.0.0.0/24"]
}
variable "CIDR_PUBLIC" {
  default = ["10.0.100.0/24"]
}

variable "service_name" {
  description = "Name of service"
  default     = "apiplatform"
}
