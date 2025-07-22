# Topic 5: Terraform for Windows Projects

1. Write main.tf
Create the main Terraform configuration that provisions a Windows virtual machine on AWS using the aws_instance resource.

2. Add outputs.tf
Define an output variable that exposes the public IP address of the Windows VM after deployment.

3. Build a reusable module (modules/rdp_sg)
Create a Terraform module that provisions a security group allowing only RDP (port 3389) access. The module should:

    Accept a vpc_id as input

    Create an ingress rule for TCP port 3389

    Output the security group ID

