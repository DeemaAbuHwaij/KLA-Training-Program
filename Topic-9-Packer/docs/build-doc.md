# Windows AMI Creation with Python – Packer

## Purpose
Build a reusable Windows AMI with Python pre-installed using HashiCorp Packer.

## Steps

### 1. Builder Configuration
- **Type:** `amazon-ebs`
- **Region:** `us-west-1`
- **Source AMI:** Windows Server 2019
- **Instance Type:** `t2.micro`
- **AMI Name:** Includes timestamp
- **Communicator:** WinRM (with SSL)

### 2. Provisioning
Provisioner installs:
- Python 3.11.5 via PowerShell
- Verifies installation with `python --version`

### 3. User Data
Script `win-init.ps1` sets up WinRM for provisioning.

### 4. Build Output
Logs stored in `logs/build.log`

## Final AMI
Use the resulting AMI ID for launching Windows EC2 instances with Python already set up.

## Commands Used
```bash
packer init packer-windows.json
packer validate packer-windows.json
packer build packer-windows.json
