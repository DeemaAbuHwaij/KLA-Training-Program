#!/bin/bash

# Load secrets from .env
if [ -f ../.env ]; then
  export $(grep -v '^#' ../.env | xargs)
fi

# Artifact file path (relative to this script)
ARTIFACT_PATH="../myapp-v1.0.0.zip"

# Repository details
REPO="libs-release-local"
REPO_PATH="myapp/1.0.0/myapp-v1.0.0.zip"

# Check that required variables are set
if [ -z "$ARTIFACTORY_URL" ] || [ -z "$ARTIFACTORY_TOKEN" ]; then
  echo "ERROR: ARTIFACTORY_URL or ARTIFACTORY_TOKEN is not set. Please export them or add them to ../.env"
  exit 1
fi

# Upload the artifact to Artifactory
curl -H "Authorization: Bearer $ARTIFACTORY_TOKEN" \
     -T "$ARTIFACT_PATH" \
     "$ARTIFACTORY_URL/$REPO/$REPO_PATH" \
     -v > ../solutions/upload.log
