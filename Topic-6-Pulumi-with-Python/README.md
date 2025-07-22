# Topic 6: Pulumi – Infrastructure as Code with Python

This project uses Pulumi and Python to deploy a Windows EC2 instance on AWS.

## 🔧 Features

- Written in Python using Pulumi
- Launches Windows VM with public IP
- Adds security group with RDP (3389) access
- Outputs RDP connection string

## 🛠 Requirements

- AWS CLI with configured credentials
- Pulumi CLI installed
- Python 3.8+ with `pulumi` and `pulumi_aws` packages

## 🚀 Deployment

```bash
pulumi up