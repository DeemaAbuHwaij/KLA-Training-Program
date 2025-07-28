Write-Host "Downloading Python..."
Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.12.0/python-3.12.0-amd64.exe" -OutFile "C:\\python.exe"

Write-Host "Installing Python..."
Start-Process -FilePath "C:\\python.exe" -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1" -Wait

Write-Host "Cleaning up..."
Remove-Item "C:\\python.exe"

Write-Host "Python installation completed."
