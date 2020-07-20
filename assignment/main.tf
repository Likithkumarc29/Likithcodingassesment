provider "aws" {
  region = var.region
}


module "vpc" {
  source             = "./vpc"
  cidr               = "172.48.0.0/16"
  bastian_subnet     = "172.48.1.0/24"
  frontend_subnet    = "172.48.2.0/24"
  backend_subnet     = "172.48.3.0/24"
  availability_zone  = "us-west-1a"
  vpc_name           = "testvpc"
  ssh_cidr           = ["103.49.27.89/32"]
}

module "ec2" {
  source                       = "./ec2"
  ami_id                       = "ami-01311df3780ebd33e"
  instance_type                = "t3.small"
  key_name                     = "test-key"
  volume_size                  = 30
  bastian_subnet               = module.vpc.bastian_subnet
  frontend_subnet              = module.vpc.frontend_subnet
  backend_subnet               = module.vpc.backend_subnet
  bastian_security_group       = module.vpc.bastian_sg
  frontend_security_group      = module.vpc.frontend_sg
  backend_security_group       = module.vpc.backend_sg
}