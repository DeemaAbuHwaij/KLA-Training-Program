# Windows Docker – IIS Container

## Description
A simple Windows-based Docker container running IIS on port 80.

## Build & Run

```bash
docker build -t windows-iis .
docker run -d -p 8080:80 windows-iis
