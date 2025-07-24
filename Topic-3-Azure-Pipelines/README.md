# Topic 3 – Azure Pipelines 🚀

## What You'll Learn

- Azure DevOps pipeline structure
- YAML schema: trigger, stages, jobs, variables
- Secrets and approval management
- Pull request integration and manual approvals

---

## Tasks

- ✅ Convert the Jenkins pipeline to an Azure pipeline  
- ✅ Add a stage that separates build into dev/prod  
- ✅ Use runtime variables  
- ✅ Test the pipeline through Pull Requests and add an approval condition

---

## Files

| File | Description |
|------|-------------|
| `azure-pipelines.yml` | The main pipeline file defining all build and deploy logic |
| `docs/azure-pipeline-doc.md` | Documentation explaining pipeline structure and execution |
| `README.md` | This overview file |

---

## Key Features

- **Trigger on Main Branch & PRs**  
  Automatically runs when changes are pushed or a PR is opened targeting `main`.

- **Runtime Parameters**  
  Accepts:
  - `BuildEnvironment`: `dev` or `prod`
  - `tag`: Docker image tag 

- **Environment Separation**  
  Two conditional stages:
  - `Build_Dev`: builds and pushes to dev
  - `Build_Prod`: builds and pushes to prod (requires manual approval)

- **Secret Management**  
  Credentials (`DOCKERHUB_USERNAME`, `DOCKERHUB_TOKEN`) are stored securely in a variable group named `DockerSecrets`.

- **Approval Condition for Production**  
  The `Build_Prod` stage uses an Azure Environment (`prod-approval`) with a manual approval step before pushing the image.

---

## Testing Instructions

1. Navigate to the pipeline in Azure DevOps.
2. Click **Run pipeline**.
3. Provide values for:
   - `BuildEnvironment` 
   - `tag` 
4. Monitor logs to ensure Docker image is built and pushed successfully.
5. To test PR trigger:
   - Create a branch
   - Push a change (e.g., update README)
   - Open a Pull Request → Pipeline should trigger automatically.
6. If `BuildEnvironment = prod`, the pipeline will:
   - Pause at the `Build_Prod` stage
   - Require manual approval from the Azure DevOps Environments UI before continuing

---

## Outcome

You will have:
- A working CI/CD pipeline built entirely in YAML
- Dynamic builds for development and production
- Docker images pushed to DockerHub using secure secrets
- Manual approval before deploying to production
- Pull Request-based validation with automatic triggers

