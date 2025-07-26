# Use the official Windows Server Core image with IIS
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Enable IIS
RUN powershell -NoProfile -Command "Add-WindowsFeature Web-Server"

# Copy custom HTML (optional, for better browser check)
COPY index.html C:/inetpub/wwwroot/index.html

# Expose port 80
EXPOSE 80

# Start IIS service
CMD ["powershell", "-NoProfile", "-Command", "Start-Service W3SVC; while ($true) { Start-Sleep -Seconds 3600 }"]

