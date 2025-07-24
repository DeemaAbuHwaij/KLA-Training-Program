# Topic 6: Pulumi – Infrastructure as Code with Python

## What You’ll Learn
- Defining AWS infrastructure using Pulumi and Python
- Automating EC2 instance provisioning
- Using Pulumi config and stack environments
- Managing infrastructure lifecycle with Pulumi CLI

---

## Project Setup

### Prerequisites
- Python 3.8+
- Pulumi CLI installed ([install guide](https://www.pulumi.com/docs/install/))
- AWS CLI configured with valid credentials (`aws configure`)
- AWS Key Pair created for EC2 access

### Install Python Dependencies
```bash
pip install -r requirements.txt
```

---

## Environment Details

- **Cloud provider**: AWS
- **Region**: Based on your AWS CLI profile (e.g., `us-west-2`)
- **Language**: Python 3.12
- **Pulumi stack**: `dev`
- **Resources**:
  - EC2 instance (Windows)
  - Security Group allowing RDP (`TCP 3389`)
- **Configuration**:
  - `windows_ami`
  - `instance_type`
  - `key_name`
  - `vpc_id`
  - `subnet_id`

---

## Deployment Steps

### 1. Initialize the Pulumi stack
```bash
pulumi stack init dev
```

### 2. Set configuration values
```bash
pulumi config set windows_ami ami-xxxxxxxx
pulumi config set key_name your-keypair
pulumi config set vpc_id vpc-xxxxxxxx
pulumi config set subnet_id subnet-xxxxxxxx
```

### 3. Deploy the infrastructure
```bash
pulumi up
```

### 4. View Outputs
Pulumi will output:
- `instance_id`: EC2 resource ID
- `public_ip`: Use this to connect via RDP

---

## Cleanup Logic

This Pulumi script does not destroy resources automatically in code (to prevent accidental deletion).  
To clean up your environment safely:

```bash
pulumi destroy
pulumi stack rm dev
```

Pulumi will handle resource destruction in the correct dependency order.

---

## What Was Built and Why

This project provisions a **Windows EC2 instance** on AWS using infrastructure as code (IaC) via Pulumi and Python.

### Resources Created:
- **EC2 Instance**: Publicly accessible Windows server
- **Security Group**: Allows RDP access on port `3389`
- **Configurable Parameters**: Allow this script to be reused in different environments or regions

### Purpose:
- Learn Pulumi and how to manage cloud resources with general-purpose programming (Python)
- Demonstrate full lifecycle: deploy, update, destroy
- Provide secure remote access via RDP to a custom cloud server

---

## Screenshot

The deployment result is shown in `docs/Deployment-screenshot.png`.
The outputs are shown in `docs/Outputs-screenshot.png`.


---

## Project Files

| File                  | Description                                  |
|-----------------------|----------------------------------------------|
| `__main__.py`         | Pulumi Python script defining infrastructure |
| `Pulumi.yaml`         | Project configuration                        |
| `Pulumi.dev.yaml`     | Stack-specific values                        |
| `requirements.txt`    | Python dependencies                          |
| `docs/description.md` | Infrastructure explanation                   |
| `docs/Deployment-screenshot.png` | Pulumi deployment confirmation screenshot |