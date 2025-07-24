# Infrastructure Description – Topic 6: Pulumi with Python

This project uses **Pulumi with Python** to provision and manage AWS infrastructure as code. It demonstrates how to define a secure, reproducible, and automated environment for launching a cloud server.

---

## What Was Built

### 1. **EC2 Windows Server Instance**
- **Name**: `windows-server`
- **Type**: `t3.medium`
- **AMI**: Configurable Windows AMI passed via Pulumi config
- **Purpose**: Acts as a remote-accessible server (via RDP)

### 2. **Security Group**
- **Name**: `rdp-sg`
- **Purpose**: Allows RDP (Remote Desktop Protocol) traffic from any IP (`0.0.0.0/0`)
- **Ports Opened**:
  - Ingress: TCP port `3389`
  - Egress: All protocols

### 3. **Pulumi Stack Configuration**
- Stack: `dev`
- Configurable parameters include:
  - `instance_type`
  - `windows_ami`
  - `key_name`
  - `vpc_id`
  - `subnet_id`

---

## Why This Was Built

- To **learn Pulumi** as a modern alternative to Terraform and CloudFormation
- To understand how to **define infrastructure in Python**
- To practice **automated provisioning** of a Windows server on AWS
- To **securely expose only necessary services** (RDP in this case)

---

## Deployment Outputs

- `instance_id`: The AWS resource ID of the EC2 instance
- `public_ip`: The IP address used for connecting via RDP

---

## Notes

- You must use a valid AWS Key Pair to connect to the instance.
- The instance must be in a **public subnet** and have **associate_public_ip_address=True**.
- RDP access from `0.0.0.0/0` is allowed for testing but not recommended for production.

---

## Cleanup

To destroy the environment and avoid billing:
```bash
pulumi destroy
