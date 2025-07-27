# Topic 5: Terraform for Windows Projects

## What You’ll Learn
- Creating a virtual Windows machine with configuration
- Using variables and outputs 
- Working with modules

##  Tasks

1. Write main.tf to create a Windows VM
2. Add output.tf with the VM's IP address
Build a module for a security group allowing only RDP access
3. Build a reusable module (modules/rdp_sg)

## Resources Created
- Azure Resource Group: `windows-rg`
- Virtual Network: `windows-vnet`
- Subnet: `windows-subnet`
- Network Security Group (RDP only)
- Public IP 
- Network Interface (NIC)
- Windows Virtual Machine: `windows-vm`

## Configuration Summary
- VM Size: `Standard B2ms` 
- OS: `Windows Server 2019 Datacenter`
- Location: `East US`
- RDP Port 3389 is enabled via NSG
- Admin user/pass from `terraform.tfvars`

## How to Deploy

```bash
terraform init
terraform plan -out=tfplan
terraform apply tfplan
