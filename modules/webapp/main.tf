terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name        = "${var.environment}-${var.app_name}"
    Environment = var.environment
  }

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    echo "<h1>${var.environment} environment running on AWS EC2</h1>" > /var/www/html/index.html
  EOF
}

output "instance_public_ip" {
  value = aws_instance.web.public_ip
}

output "instance_public_dns" {
  value = aws_instance.web.public_dns
}
