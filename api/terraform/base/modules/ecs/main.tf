resource "aws_ecs_cluster" "main" {
  name = "${terraform.workspace}-tf-ecs-cluster"
}