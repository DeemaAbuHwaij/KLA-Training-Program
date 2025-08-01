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

## What Was Built

This project uses **Pulumi with Python** to deploy a virtual Windows server on **Microsoft Azure**. The infrastructure includes:

- A **Resource Group** to organize all resources.
- A **Virtual Network** and **Subnet** to manage internal networking.
- A **Public IP Address** to expose the VM externally.
- A **Network Interface Card (NIC)** connected to the subnet and public IP.
- A **Windows Virtual Machine** (Windows Server 2019 Datacenter) with the `Standard_B2ms` size.

The admin credentials are managed securely using Pulumi configuration secrets.

## Why This Setup

This setup simulates a basic real-world deployment of a virtual server on Azure for testing, learning, or hosting simple workloads. It demonstrates:

- Using **Python** for IaC (Infrastructure as Code)
- Managing cloud infrastructure declaratively
- Storing secrets securely
- Deploying repeatable environments with minimal manual steps

## Outputs

-**Public IP:** `172.176.178.79`

## Deployment Steps

1. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

2. Set Pulumi config values:
   ```bash
   pulumi config set azure-native:location ...
   pulumi config set admin_username ...
   pulumi config set --secret admin_password ...
   ```

3. Deploy the stack:
   ```bash
   pulumi up
   ```

## Cleanup

To destroy the environment:
```bash
pulumi destroy
```

Then, optionally remove the stack:
```bash
pulumi stack rm dev
```