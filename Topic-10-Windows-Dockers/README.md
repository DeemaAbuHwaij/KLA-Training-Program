# Topic 10: Windows Dockers – Building Containers on Windows

## What You’ll Learn
- Building and running Windows-based containers
- Differences between Linux and Windows containers
- Working with Docker Desktop for Windows environments

---

## Tasks Completed
- Wrote a Dockerfile configured to run IIS using `windows/servercore:ltsc2022`
- Exposed port 80 and verified in browser at [http://localhost:8080](http://localhost:8080)
- Pushed the final image to Docker Hub:  
  [https://hub.docker.com/r/deemaa/windows-iis-demo](https://hub.docker.com/r/deemaa/windows-iis-demo)

---

## How to Run This Project

### 1. Build the Docker Image

```bash
docker build -t windows-iis-demo .
```

### 2. Run the Container

```bash
docker run -d -p 8080:80 windows-iis-demo
```

### 3. Open in Browser

Navigate to [http://localhost:8080](http://localhost:8080)  
You should see a message: `IIS is Running on Windows Container!`

---

## Docker Hub Push Commands

```bash
docker login
docker tag windows-iis-demo deemaa/windows-iis-demo
docker push deemaa/windows-iis-demo
```

---

## Project Structure

```
Topic-10-Windows-Dockers/
├── Dockerfile                 # Builds the Windows IIS container
├── index.html                # Custom landing page for IIS
├── build_output.txt          # Output from docker build
├── run_output.txt            # Output from docker run
├── docker_push_output.txt    # Output from docker push
├── browser_screenshot.png    # Screenshot of the service in browser
└── README.md                 # This file
```

---

