# Artifactory Cleanup Policy – Old Version Retention

## 🎯 Objective
Automatically delete older versions of build artifacts to save storage.

## 🧾 Policy Rules

- Apply to: `libs-release-local`
- Keep only the **last 5 versions** of each artifact
- Delete versions older than 30 days
- Exclude versions with tag `stable` or `release`

## 🔧 Configuration (Example with JFrog UI or YAML)

If using Artifactory Pro/X, go to:
`Admin > Retention Policies > Add Policy`

YAML:
```yaml
policies:
  - name: cleanup-old-builds
    includesPattern: "myapp/**"
    retentionPeriodDays: 30
    maxBuilds: 5
    excludeBuildsTagged: ["stable", "release"]
    enabled: true
