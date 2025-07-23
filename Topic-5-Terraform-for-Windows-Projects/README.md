# Topic 5: Terraform for Windows Projects

## What You’ll Learn
- Creating a virtual Windows machine with configuration
- Using variables and outputs 
- Working with modules

---

## Usage Instructions

1. **Clone the repository** or create the file structure shown above.
2. **Edit `terraform.tfvars`** with your specific values:
   - AWS region (e.g., `us-west-1`)
   - Windows AMI ID (e.g., `ami-0d263f3f8e9a9f06a`)
   - EC2 key pair name
   - Subnet ID
   - VPC ID

3. **Run Terraform commands:**

```bash
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

4. **Use the output public_ip to**:

    - Connect via Remote Desktop (RDP) using your .pem key and decrypted password from AWS Console
    - Validate that the VM is reachable and functioning

