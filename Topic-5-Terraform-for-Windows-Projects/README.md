# Topic 5: Terraform for Windows Projects

## 📚 What You’ll Learn
- Creating a virtual Windows machine on AWS using Terraform
- Defining reusable modules (e.g., security group for RDP)
- Managing variables and outputs
- Using Terraform to provision infrastructure as code

---

## 🧱 Project Structure

windows-terraform/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── modules/
│ └── rdp_sg/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf


---

## 🛠 Instructions

1. Clone the repo or copy the structure above.
2. Edit `terraform.tfvars` with your:
   - AWS region
   - Windows AMI ID
   - Key pair name
   - Subnet ID
   - VPC ID
3. Run:
   ```bash
   terraform init
   terraform plan
   terraform apply
4. Use the output public IP to RDP into the instance.

5. Take a screenshot of the Windows desktop.