import pulumi
import pulumi_aws as aws

# Configurations
config = pulumi.Config()
instance_type = config.get("instance_type") or "t3.medium"
ami = config.require("windows_ami")
key_name = config.require("key_name")
vpc_id = config.require("vpc_id")
subnet_id = config.require("subnet_id")

# Security Group for RDP
rdp_sg = aws.ec2.SecurityGroup("rdp-sg",
    description="Allow RDP",
    vpc_id=vpc_id,
    ingress=[{
        "protocol": "tcp",
        "from_port": 3389,
        "to_port": 3389,
        "cidr_blocks": ["0.0.0.0/0"]
    }],
    egress=[{
        "protocol": "-1",
        "from_port": 0,
        "to_port": 0,
        "cidr_blocks": ["0.0.0.0/0"]
    }]
)

# Windows Server EC2
server = aws.ec2.Instance("windows-server",
    instance_type=instance_type,
    ami=ami,
    key_name=key_name,
    subnet_id=subnet_id,
    associate_public_ip_address=True,
    vpc_security_group_ids=[rdp_sg.id],
    tags={"Name": "PulumiWindowsServer"}
)

# Outputs
pulumi.export("instance_id", server.id)
pulumi.export("public_ip", server.public_ip)

# Info message
pulumi.log.info("To clean up, run: pulumi destroy")