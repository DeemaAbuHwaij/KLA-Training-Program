provider "aws" {
  region = var.aws_region
}


// create a Windows VM
resource "aws_instance" "windows_vm" {
  ami                         = var.windows_ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [module.rdp_sg.sg_id]  // get the security group from the module
  subnet_id                   = var.subnet_id

  associate_public_ip_address = true

  tags = {
    Name = "Terraform-Windows-VM"
  }
}

//module for a security group allowing only RDP access.
module "rdp_sg" {
  source = "./modules/rdp_sg"
  vpc_id = var.vpc_id
}
