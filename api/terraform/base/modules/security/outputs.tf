output "internal_id" {
  value = aws_security_group.internal.id
}

output "inbound_id" {
  value = aws_security_group.inbound.id
}

output "ecs_service_role_arn" {
  value = aws_iam_role.ecs_service_role.arn
}

output "fargate_role_arn" {
  value = aws_iam_role.fargate_role.arn
}

output "aws_security_group_ecs_id" {
  value = aws_security_group.ecs.id
}
