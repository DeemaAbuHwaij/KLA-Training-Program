# Topic 7 – Artifactory: Managing Build Artifacts

## What you’ll learn:
- Managing software packages, builds, and Docker images using Artifactory 
- Automating artifact uploads and applying cleanup policies 
- Understanding how Artifactory fits into the CI/CD pipeline

## Tasks:
- Upload a file to Artifactory using a curl command 
- Create and document a policy for removing old artifact versions 
- Set up folder structures for organizing builds 
- Integrate Artifactory into a build process (optional for advanced students)

## How to Use

### 1. Configure Your Environment

Create a `.env` file :
```env
ARTIFACTORY_URL=https://trialruhipq.jfrog.io/artifactory
ARTIFACTORY_TOKEN=your_token_here
```

### 2. Run the Upload Script
From the `scripts/` folder:

```bash
chmod +x upload.sh
./upload.sh
```

### 3. Output
The upload log will be written to:
```
../solutions/upload.log
```

The uploaded file will be accessible via:
```
https://trialruhipq.jfrog.io/artifactory/libs-release-local/myapp/1.0.0/myapp-v1.0.0.zip
```