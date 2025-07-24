# Azure Pipeline Structure – Polybot

## Overview
This pipeline builds and deploys the Polybot Docker image to either the Dev or Prod environment based on runtime parameters.
It uses DockerHub for image storage and Azure DevOps for CI/CD orchestration.


## Stages
- **Build_Dev**: Runs only if `BuildEnvironment=dev`. Builds and pushes the Docker image to the dev tag.
- **Build_Prod**: Runs only if `BuildEnvironment=prod` (after Dev), and requires manual approval via Azure DevOps environment.

## Runtime Parameters
- `BuildEnvironment`: Accepts `dev` or `prod` to control which stage is executed.
- `tag`: Docker image tag to build and push (e.g., `latest`, `v1.0.0`).

## Secret Management
- DockerHub credentials (`DOCKERHUB_USERNAME`, `DOCKERHUB_TOKEN`) are stored securely in a variable group named `DockerSecrets`.

## Pull Request Validation
- Pull Requests targeting the `main` branch automatically trigger the pipeline.
- If `BuildEnvironment=prod`, the `Build_Prod` stage pauses and waits for manual approval before proceeding.

