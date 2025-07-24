# Azure Provider Configuration
# Specifies you're using Azure and sets your subscription explicitly
provider "azurerm" {
  features {}
  subscription_id = "224b3184-d1b2-48ab-a0e0-f6cd58ba8c11"
}

# Create a Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "windows-rg"
  location = var.location
}

# Create a Virtual Network (VNet)
resource "azurerm_virtual_network" "vnet" {
  name                = "windows-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Create a Subnet within the VNet
resource "azurerm_subnet" "subnet" {
  name                 = "windows-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Include NSG Module (Allows RDP)
# This pulls a custom module from ./modules/rdp_sg which defines port 3389 access
module "rdp_sg" {
  source              = "./modules/rdp_sg"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Create a Public IP (Required for RDP)
resource "azurerm_public_ip" "public_ip" {
  name                = "windows-pip"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"     # Required for Standard SKU
  sku                 = "Standard"   # Required for VM NIC compatibility
}

# Create a Network Interface (NIC) and link to Subnet + Public IP
resource "azurerm_network_interface" "nic" {
  name                = "windows-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                           = "internal"
    subnet_id                      = azurerm_subnet.subnet.id
    private_ip_address_allocation  = "Dynamic"
    public_ip_address_id           = azurerm_public_ip.public_ip.id
  }
}

# Create the Windows Virtual Machine
resource "azurerm_windows_virtual_machine" "vm" {
  name                = "windows-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # Use a supported public Windows Server image
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}
