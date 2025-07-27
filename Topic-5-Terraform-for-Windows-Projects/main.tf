provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "windows_vm" {
  ami                         = var.windows_ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [module.rdp_sg.sg_id]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true

  tags = {
    Name = "Terraform-Windows-VM"
  }
}

module "rdp_sg" {
  source = "./modules/rdp_sg"
  vpc_id = var.vpc_id
}