# Artifactory Cleanup Policy

- **Policy Name:** `delete-old-artifacts`
- **Target:** All repositories
- **Condition:**
  - Keep only the latest 5 versions
  - Delete if older than 30 days
- **Schedule:** Daily at midnight