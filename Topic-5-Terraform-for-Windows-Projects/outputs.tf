
output "public_ip" {
  value       = aws_instance.windows_vm.public_ip
  description = "Public IP of the Windows VM"
}