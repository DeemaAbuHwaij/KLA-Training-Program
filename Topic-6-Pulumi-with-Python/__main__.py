import pulumi
from pulumi import Config
import pulumi_azure_native as azure_native
from pulumi import ResourceOptions

# Config
config = Config()
admin_username = config.require("admin_username")
admin_password = config.require_secret("admin_password")

# Resource Group
resource_group = azure_native.resources.ResourceGroup("rg")

# Virtual Network
vnet = azure_native.network.VirtualNetwork("vnet",
    resource_group_name=resource_group.name,
    address_space=azure_native.network.AddressSpaceArgs(
        address_prefixes=["10.0.0.0/16"],
    ))

# Subnet
subnet = azure_native.network.Subnet("subnet",
    resource_group_name=resource_group.name,
    virtual_network_name=vnet.name,
    address_prefix="10.0.1.0/24",
    opts = ResourceOptions(depends_on=[vnet]))

# Public IP
public_ip = azure_native.network.PublicIPAddress("public-ip",
    resource_group_name=resource_group.name,
    public_ip_allocation_method="Static",
    sku=azure_native.network.PublicIPAddressSkuArgs(
        name="Standard"
    )
)

# Network Interface

network_interface = azure_native.network.NetworkInterface("nic",
    resource_group_name=resource_group.name,
    ip_configurations=[azure_native.network.NetworkInterfaceIPConfigurationArgs(
        name="ipconfig1",
        subnet=azure_native.network.SubnetArgs(
            id=subnet.id.apply(lambda sid: sid)  # ensures it's resolved properly
        ),
        private_ip_allocation_method="Dynamic",
        public_ip_address=azure_native.network.PublicIPAddressArgs(
            id=public_ip.id
        )
    )],
    opts=ResourceOptions(depends_on=[subnet, public_ip])
)

# Virtual Machine
vm = azure_native.compute.VirtualMachine("vm",
    resource_group_name=resource_group.name,
    hardware_profile=azure_native.compute.HardwareProfileArgs(
        vm_size="Standard_B2ms",
    ),
    os_profile=azure_native.compute.OSProfileArgs(
        computer_name="myvm",
        admin_username=admin_username,
        admin_password=admin_password,
    ),
    network_profile=azure_native.compute.NetworkProfileArgs(
        network_interfaces=[azure_native.compute.NetworkInterfaceReferenceArgs(
            id=network_interface.id,
            primary=True,
        )],
    ),
    storage_profile=azure_native.compute.StorageProfileArgs(
        os_disk=azure_native.compute.OSDiskArgs(
            create_option="FromImage",
            managed_disk=azure_native.compute.ManagedDiskParametersArgs(
                storage_account_type="Standard_LRS",
            ),
            name="myosdisk",
        ),
        image_reference=azure_native.compute.ImageReferenceArgs(
            publisher="MicrosoftWindowsServer",
            offer="WindowsServer",
            sku="2019-Datacenter",
            version="latest",
        ),
    ))

# Output public IP
pulumi.export("public_ip", public_ip.ip_address)