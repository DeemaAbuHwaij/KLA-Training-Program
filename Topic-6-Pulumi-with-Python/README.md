# Topic 6: Pulumi – Infrastructure as Code with Python

## What You’ll Learn
- How to define infrastructure as code using Pulumi in Python
- Creating and managing cloud resources programmatically
- Understanding the benefits of using a general-purpose language for IaC

## Tasks:
- Write Pulumi code (__main__.py) that deploys a cloud server
- Configure the project and deploy using the Pulumi CLI
- Document the setup and environment
- Add cleanup logic to the script


## 📌 What Was Built

This project provisions a basic EC2 server on AWS using Pulumi and Python:

- A **Security Group** allowing inbound SSH (port 22) traffic
- A **t2.micro EC2 instance** running Amazon Linux 2
- Public IP and DNS exported using `pulumi.export(...)`

---

## Why Use This

- Demonstrates **Infrastructure as Code (IaC)** using Python
- Uses Pulumi to programmatically provision cloud resources
- Provides a reusable template for cloud server deployment

---

## Setup & Deployment

### 1. Create a virtual environment and install dependencies

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### 2. Initialize Pulumi stack

```bash
pulumi stack init dev
pulumi config set aws:region us-west-1
```

### 3. Deploy

```bash
pulumi up
```

---

## Access the Server

Use the exported public IP or DNS to SSH into the instance (requires key pair):

```bash
ssh ec2-user@<publicIp>
```

---

## Cleanup

To destroy everything and delete the stack:

```bash
python cleanup.py
```

---

## Files

| File                            | Description           |
|---------------------------------|-----------------------|
| `__main__.py`                   | Pulumi code           |
| `Pulumi.yaml`                   | Project settings      |
| `Pulumi.dev.yaml`               | Stack config          |
| `requirements.txt`              | Python dependencies   |
| `cleanup.py`                    | Stack teardown script |
| `README.md`                     | Documentation         |
| `pulumi-browser-screenshot.png` | Deployment screenshot |
| `outputs-screenshot.png`        | Outputs screenshot    |


---

