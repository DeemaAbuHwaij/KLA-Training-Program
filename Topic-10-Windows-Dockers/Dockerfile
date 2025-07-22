# Use the official Windows IIS base image
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Enable IIS
RUN powershell -NoProfile -Command "Add-WindowsFeature Web-Server"

# Expose port 80
EXPOSE 80

# Start IIS when the container launches
CMD ["powershell", "-NoProfile", "-Command", "Start-Service W3SVC; while ($true) { Start-Sleep -Seconds 3600 }"]
