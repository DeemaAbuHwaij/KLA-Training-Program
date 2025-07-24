# Azure Pipeline Structure – Polybot

## Overview
This pipeline deploys the Polybot service using Docker to Dev and Prod environments, based on runtime input.

## Stages
- **Build_Dev**: Runs only if `BuildEnvironment=dev`. Simulates build and push.
- **Build_Prod**: Runs if `BuildEnvironment=prod` and after `Build_Dev`, with approval required.

## Runtime Variables
- `BuildEnvironment`: Accepts `dev` or `prod`
- `tag`: Docker tag for the image (e.g., `latest`, `v1.0.0`)

## PR Validation
- Pull Requests to `main` automatically trigger the pipeline.
- Production deploys require reviewer approval before execution.
