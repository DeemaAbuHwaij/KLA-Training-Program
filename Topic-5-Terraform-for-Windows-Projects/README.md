
# Topic 5: Terraform for Windows Projects

## What You’ll Learn
- Creating a virtual Windows machine on AWS using Terraform
- Defining reusable modules (e.g., security group for RDP access only)
- Managing variables and outputs using `tfvars`
- Using Terraform outputs (including JSON format)
- Capturing infrastructure results with screenshots

---

## Task Instructions

1. Write `main.tf` to launch a Windows VM and attach a security group.
2. Create a reusable module for allowing RDP (port 3389).
3. Use `variables.tf` and `terraform.tfvars` to separate configuration.
4. Output the public IP of the instance.
5. Take screenshots of:
   - `terraform apply` output
   - The Windows VM running in the AWS Console

---

## Project Structure

```
Topic-5-Terraform-for-Windows-Projects/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── terraform.tfstate
├── terraform-outputs.json
├── windows-vm-screenshot.png
├── README.md
├── modules/
│   └── rdp_sg/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
```

---

## 🛠 Usage Instructions

1. **Edit `terraform.tfvars`** with your own values:
   ```hcl
   aws_region     = "us-west-1"
   windows_ami    = "ami-xxxxxxxx"
   instance_type  = "t3.medium"
   key_name       = "your-keypair"
   vpc_id         = "vpc-xxxxxxxx"
   subnet_id      = "subnet-xxxxxxxx"
   ```

2. **Run the Terraform commands**:
   ```bash
   terraform init
   terraform plan -var-file="terraform.tfvars"
   terraform apply -var-file="terraform.tfvars"
   ```

3. **Get output**:
   - Raw output:
     ```bash
     terraform output
     ```
   - JSON output:
     ```bash
     terraform output -json > terraform-outputs.json
     ```

4. **Connect via RDP** using the `public_ip` value from output.

---

## Deliverables

- Terraform project files
- Screenshot of `terraform apply` output
- Screenshot of the Windows VM in AWS Console (`windows-vm-screenshot.png`)
- Public IP saved in `terraform-outputs.json`

---

