# Folder Structure – Artifactory Layout

Artifacts are organized by project and version like this:

```
libs-release-local/
└── myapp/
    └── 1.0.0/
        └── myapp-v1.0.0.zip
```

## Naming Convention
- `myapp/` is the project name
- `1.0.0/` is the version folder
- `myapp-v1.0.0.zip` is the artifact

## Benefits
- Easy to track and manage releases
- Compatible with cleanup policies
- Supports versioned deployments

> 📌 This folder structure is automatically created in Artifactory by the upload script (`upload.sh`), which declares the path:
>
> `libs-release-local/myapp/1.0.0/myapp-v1.0.0.zip`
