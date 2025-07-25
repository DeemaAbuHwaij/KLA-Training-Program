# Topic 9: Packer – Creating Prebuilt Machine Images (Azure)

## What You’ll Learn
- Creating reusable VM images (e.g., AMI, VHD)
- Using Provisioners and Builders to automate image creation 
- Maintaining consistent environments through image cloning

## Tasks:
- Write a packer.json file to build a Windows AMI 
- Add a provisioner that installs software like Python 
- Execute the image build process and document each stage

## Project Contents

```
Topic-9-Packer/
├── packer.json                 # Main Packer template
├── scripts/
│   └── install_python.ps1      
├── docs/
│   └── build-process.md        # Full explanation of build stages
├── output/
│   └── packer-log.txt          # CLI output from successful build
└── README.md                   
```

---

## How to Run the Build

1. Authenticate with Azure:
   ```bash
   az login
   ```

2. Create a service principal (once):
   ```bash
   az ad sp create-for-rbac --name "packer-sp" --role Contributor \
     --scopes /subscriptions/<your-subscription-id>
   ```

3. Set values in your terminal:
   ```bash
   export ARM_CLIENT_ID="..."
   export ARM_CLIENT_SECRET="..."
   export ARM_TENANT_ID="..."
   export ARM_SUBSCRIPTION_ID="..."
   ```

4. Run the build:
   ```bash
   packer build \
     -var "client_id=$ARM_CLIENT_ID" \
     -var "client_secret=$ARM_CLIENT_SECRET" \
     -var "tenant_id=$ARM_TENANT_ID" \
     -var "subscription_id=$ARM_SUBSCRIPTION_ID" \
     packer.json
   ```

---

## Output Image

After a successful run, you’ll find the managed image in your Azure account under:

- **Resource Group**: `packer-rg`
- **Image Name**: `windows-python-<timestamp>`

You can now use this image to launch VMs with Python pre-installed.