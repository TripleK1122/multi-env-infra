module "dev_webapp" {
  source        = "../../modules/webapp"
  app_name      = "myapp"
  environment   = "dev"
  region        = "us-east-1"
  ami_id        = "ami-0c02fb55956c7d316" # Amazon Linux 2
  instance_type = "t2.micro"
}



output "dev_instance_public_ip" {
  value = module.dev_webapp.public_ip
}

output "dev_instance_public_dns" {
  value = module.dev_webapp.public_dns
}
