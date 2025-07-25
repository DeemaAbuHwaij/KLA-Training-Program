# Cleanup Policy

## Objective
Maintain a clean artifact repository by automatically deleting older versions.

## Retention Rule
- Retain the **latest 5 versions** of each artifact
- Delete versions older than that
- Cleanup runs weekly (recommended via cron or policy rule)

## Example (for Enterprise Users)
If using JFrog's cleanup policies:
```json
{
  "policies": [
    {
      "name": "retain-last-5",
      "criteria": {
        "maxVersions": 5
      },
      "repos": ["libs-release-local"]
    }
  ]
}
```