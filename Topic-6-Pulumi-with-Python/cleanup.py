import subprocess

# Destroy the stack without prompt
subprocess.run(["pulumi", "destroy", "--yes"], check=True)

# Remove the stack
subprocess.run(["pulumi", "stack", "rm", "--yes", "dev"], check=True)

print("Pulumi stack destroyed and deleted.")