import pulumi
import pulumi_azure_native as azure_native

config = pulumi.Config()
admin_username = config.get("admin_username") or "azureuser"
admin_password = config.require_secret("admin_password")  # must meet Azure password complexity
vm_size = config.get("vm_size") or "Standard_B2ms"

# 1. Resource Group
resource_group = azure_native.resources.ResourceGroup("rg")

# 2. Virtual Network
vnet = azure_native.network.VirtualNetwork("vnet",
    resource_group_name=resource_group.name,
    address_space={"address_prefixes": ["10.0.0.0/16"]})

# 3. Subnet
subnet = azure_native.network.Subnet("subnet",
    resource_group_name=resource_group.name,
    virtual_network_name=vnet.name,
    address_prefix="10.0.1.0/24")

# 4. Public IP
public_ip = azure_native.network.PublicIPAddress("public-ip",
    resource_group_name=resource_group.name,
    public_ip_allocation_method="Dynamic")

# 5. Network Interface
nic = azure_native.network.NetworkInterface("nic",
    resource_group_name=resource_group.name,
    ip_configurations=[{
        "name": "ipconfig",
        "subnet": {"id": subnet.id},
        "public_ip_address": {"id": public_ip.id},
    }])

# 6. Windows Virtual Machine
vm = azure_native.compute.VirtualMachine("win-vm",
    resource_group_name=resource_group.name,
    network_profile={"network_interfaces": [{"id": nic.id}]},
    hardware_profile={"vm_size": vm_size},
    os_profile={
        "computer_name": "winvm",
        "admin_username": admin_username,
        "admin_password": admin_password,
    },
    storage_profile={
        "os_disk": {
            "name": "osdisk",
            "caching": "ReadWrite",
            "create_option": "FromImage",
            "managed_disk": {"storage_account_type": "Standard_LRS"},
        },
        "image_reference": {
            "publisher": "MicrosoftWindowsServer",
            "offer": "WindowsServer",
            "sku": "2019-Datacenter",
            "version": "latest",
        },
    }
)

# 7. Outputs
pulumi.export("vm_name", vm.name)
pulumi.export("public_ip", public_ip.ip_address)
