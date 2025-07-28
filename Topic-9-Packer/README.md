# Topic 9: Packer – Creating Prebuilt Machine Images

## What You’ll Learn
- Creating reusable VM images (e.g., **AMI** for AWS)
- Using **Provisioners and Builders** to automate image creation
- Maintaining consistent environments through image cloning

---

## Tasks
- Write a `packer.json` file to build a **Windows AMI**
- Add a **provisioner** that installs software like Python
- Execute the **image build process** and document each stage

---

## Project Contents

```
Topic-9-Packer/
├── packer.json                 # Main Packer template (AWS)
├── packer-config.pkr.hcl       # Plugin configuration for amazon-ebs
├── output/
│   └── packer-output.log       # CLI output from successful build
├── docs/
│   └── build-process.md      
├── scripts/
│   └── install_python.ps1
└── README.md                   
```

---

## How to Run the Build (AWS)

### Step 1: Set AWS credentials  
Ensure you have your AWS credentials configured via **one** of the following:

#### Option 1: Environment variables
```bash
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
```

#### Option 2: AWS CLI profile
```bash
aws configure
```

---

### Step 2: Initialize Packer plugins

Make sure you have this file:

**`packer-config.pkr.hcl`**
```hcl
packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}
```

Then run:
```bash
packer init .
```

---

### Step 3: Build the AMI

```bash
packer build packer.json | tee output/packer-output.log
```

---

## Output Image

After a successful build, you will find a **Windows AMI** in your AWS EC2 Console:

- **Region**: As defined in `packer.json` (e.g., `us-west-1`)
- **AMI Name**: `windows-python-<timestamp>`

You can now launch EC2 instances from this AMI with **Python pre-installed**.

---


## Tools Used

- [Packer](https://developer.hashicorp.com/packer)
