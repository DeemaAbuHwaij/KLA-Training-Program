#!/bin/bash

# Use credentials from environment variables
username="$ARTIFACTORY_USER"
api_key="$ARTIFACTORY_TOKEN"

# Local file to upload
file_path="./myapp-v1.0.0.zip"

# Remote path in Artifactory
target_path="myapp/v1.0.0/myapp-v1.0.0.zip"

# Upload endpoint
upload_url="https://trialgea5kk.jfrog.io/artifactory/libs-release-local-generic-local/$target_path"

# Upload with curl
curl -u "$username:$api_key" \
     -T "$file_path" \
     "$upload_url" \
     -v > upload.log
