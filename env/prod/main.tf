module "prod_webapp" {
  source        = "../../modules/webapp"
  app_name      = "myapp"
  environment   = "prod"
  region        = "us-east-1"
  ami_id        = "ami-0c02fb55956c7d316"
  instance_type = "t3.medium"
}

output "prod_instance_public_ip" {
  value = module.prod_webapp.public_ip
}

output "prod_instance_public_dns" {
  value = module.prod_webapp.public_dns
}
