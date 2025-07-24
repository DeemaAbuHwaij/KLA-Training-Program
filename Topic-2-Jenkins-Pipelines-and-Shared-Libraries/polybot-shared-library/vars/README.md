# Polybot Shared Library

This is a Jenkins Shared Library that contains reusable pipeline code for the Polybot project.

## Structure

```
polybot-shared-library/
└── vars/
    └── deploy.groovy    # Deployment logic that updates and pushes the deployment.yaml file
```

## Function: `deploy`

The `deploy` function is used to:

1. Checkout the Git branch
2. Replace the image name in the `deployment.yaml` file
3. Commit and push the changes to GitHub

### Parameters:
- `serviceName` – The name of the folder containing the Kubernetes manifest
- `imageName` – The full image tag to update in the manifest (e.g., `deemaa/polybot:latest`)

## Usage in Jenkinsfile

```groovy
@Library('polybot-shared-library') _
deploy('polybot', 'deemaa/polybot:latest')
```