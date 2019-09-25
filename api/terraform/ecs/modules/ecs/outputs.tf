output "aws_ecs_task_definition_apiplatform_arn" {
  value = "${aws_ecs_task_definition.ecs_service.arn}"
}

output "service_name" {
  value = "${aws_ecs_service.ecs_service.name}"
}
