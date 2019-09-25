# Security group allowing internal traffic (inside VPC)
resource "aws_security_group" "internal" {
  vpc_id = var.vpc_id
  name = "${terraform.workspace}-internal"
  description = "Allow internal traffic"

  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = [
      var.vpc_cidr_block
    ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    Name = "${terraform.workspace}-internal"
  }
}

resource "aws_security_group" "ecs" {
  name = "ecs"
  description = "Allow traffic for ecs"
  vpc_id = var.vpc_id


  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = var.CIDR_PUBLIC
  }

  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = var.CIDR_PRIVATE
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    Name = "global-ecs"
  }
}

# Security group allowing inbound HTTP/HTTPS from anywhere
resource "aws_security_group" "inbound" {
  vpc_id = var.vpc_id
  name = "${terraform.workspace}-inbound"
  description = "Allow inbound HTTPS traffic"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${terraform.workspace}-inbound"
  }
}

# An IAM instance profile we attach to webservers
resource "aws_iam_instance_profile" "ec2_web" {
  name = "${terraform.workspace}-ec2-web"
  role = aws_iam_role.ec2_web.name

  lifecycle {
    create_before_destroy = true
  }
}

# An IAM role that we attach to the EC2 web instances
resource "aws_iam_role" "ec2_web" {
  name = "${terraform.workspace}-ec2-web"
  assume_role_policy = "${file("${path.module}/policies/web-front.json")}"

  lifecycle {
    create_before_destroy = true
  }
}

# IAM policy we add to EC2 web front role
resource "aws_iam_role_policy" "ec2_web" {
  name = "${terraform.workspace}-ec2-web-policy"
  role = aws_iam_role.ec2_web.id
  policy = "${file("${path.module}/policies/web-front-policy.json")}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role" "ecs_service_role" {
  name = "${terraform.workspace}-ecs"
  assume_role_policy = "${file("${path.module}/policies/ecs_role.json")}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role_policy" "ecs_service_role" {
  name = "${terraform.workspace}-ecs-policy"
  role = aws_iam_role.ecs_service_role.id
  policy = "${file("${path.module}/policies/ecs_role_policy.json")}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role" "fargate_role" {
  name = "${terraform.workspace}-ecs-fargate"
  assume_role_policy = "${file("${path.module}/policies/fargate_role.json")}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role_policy" "fargate_role" {
  name = "${terraform.workspace}-ecs-fargate-policy"
  role = aws_iam_role.fargate_role.id
  policy = "${file("${path.module}/policies/fargate_role_policy.json")}"

  lifecycle {
    create_before_destroy = true
  }
}
