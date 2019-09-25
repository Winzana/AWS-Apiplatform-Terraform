variable "vpc_id" {
  description = "Id of VPC where security groups will live"
}

variable "vpc_cidr_block" {
  description = "The source CIDR block to allow traffic from"
}

variable "CIDR_PRIVATE" {
  default = "10.0.1.0/24"
}

variable "CIDR_PUBLIC" {
  default = "10.0.101.0/24"
}
