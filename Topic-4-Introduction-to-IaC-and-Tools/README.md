# Topic 4: Introduction to Infrastructure as Code (IaC) and Tools

## What You’ll Learn:
- What is Infrastructure as Code and why it's essential in DevOps
- Overview of Terraform, Pulumi, 
- When and why to use each tool

## Project Structure

Topic-4-Introduction-to-IaC-and-Tools/
├── comparison.md # Terraform vs Pulumi (Hebrew)
├── docs/
│   ├── vault-consul.md # Roles of Vault and Consul
│   └── devops-diagram.png # Schematic diagram of a DevOps system
├── artifactory/
│   ├── upload.sh # Artifact upload script using curl
│   ├── upload.log # Sample output of a curl upload
│   ├── cleanup-policy.md # Retention policy for artifacts
│   └── folder-structure.md # Recommended artifact organization

---

## Tasks Completed

### 1. Terraform vs Pulumi Comparison
- File: `comparison.md`
- Written in Hebrew
- Explains when and why to choose each tool

### 2. Artifactory Package Management
- Upload script: `artifactory/upload.sh`
- Upload output log: `artifactory/upload.log`
- Retention policy: `artifactory/cleanup-policy.md`
- Repository folder structure: `artifactory/folder-structure.md`

### 3. Vault & Consul Overview
- File: `docs/vault-consul.md`
- Explains how each tool supports security and service discovery

### 4. DevOps Architecture Diagram
- File: `docs/devops-diagram.png`
- This diagram illustrates a typical DevOps workflow using the tools covered in this topic:
    - Developer pushes code to GitHub.
    - GitHub triggers Jenkins for CI/CD. 
    - Jenkins:
      - Builds the app 
      - Uploads artifacts to Artifactory 
      - Provisions infrastructure using Terraform/Pulumi
    - AWS hosts the deployed infrastructure.
    - Microservice/App runs on the infrastructure, pulling:
      - Artifacts from Artifactory
      - Secrets from Vault 
      - Service discovery from Consul
- These tools work together to automate deployment, secure secrets, and enable service coordination.

---

## Tools Referenced
- [Terraform by HashiCorp](https://developer.hashicorp.com/terraform/tutorials)
- [Pulumi vs Terraform](https://www.pulumi.com/docs/iac/concepts/vs/terraform/)
- [JFrog Artifactory Docs](https://jfrog.com/help/r/jfrog-artifactory-documentation)