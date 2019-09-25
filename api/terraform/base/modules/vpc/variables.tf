variable "region" {
  description = "AWS region to deploy to (e.g. ap-southeast-2)"
}
variable "az_count" {
  description = "The number of availailbilty zones to deploy across (must be minimum of two to use ALB)"
}
# Use "aws ec2 describe-availability-zones --region us-east-1"
# to figure out the name of the AZs on every region as required
variable "availability_zones" {
  description = "Availability zones by region"
  default = {
    "eu-west-1"      = "eu-west-1a,eu-west-1b,eu-west-1c"
  }
}
