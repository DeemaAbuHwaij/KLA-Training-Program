# install_python.ps1

Write-Output "Downloading Python installer..."
Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.11.5/python-3.11.5-amd64.exe" -OutFile "$env:TEMP\python-installer.exe"

Write-Output "Installing Python..."
Start-Process -FilePath "$env:TEMP\python-installer.exe" -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1" -Wait

Write-Output "Verifying installation..."

# Try different names in case 'python' isn't picked up immediately
if (Get-Command "python" -ErrorAction SilentlyContinue) {
  python --version
} elseif (Get-Command "python3" -ErrorAction SilentlyContinue) {
  python3 --version
} elseif (Test-Path "C:\Program Files\Python311\python.exe") {
  & "C:\Program Files\Python311\python.exe" --version
} else {
  Write-Output "Python executable not found (yet). It may require reboot or manual path refresh."
}
