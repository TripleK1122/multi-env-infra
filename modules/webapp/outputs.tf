output "public_ip" {
  description = "Public IP of the instance"
  value       = aws_instance.web.public_ip
}

output "public_dns" {
  description = "Public DNS of the instance"
  value       = aws_instance.web.public_dns
}
