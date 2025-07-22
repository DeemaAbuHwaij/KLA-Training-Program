# windows-terraform/main.tf
provider "aws" {
  region = var.region
}

resource "aws_instance" "windows_vm" {
  ami                    = var.windows_ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [module.rdp_sg.security_group_id]
  subnet_id              = var.subnet_id

  tags = {
    Name = "windows-vm"
  }
}

module "rdp_sg" {
  source = "./modules/rdp_sg"
  vpc_id = var.vpc_id
}
