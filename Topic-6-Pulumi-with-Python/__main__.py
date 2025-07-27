import pulumi
import pulumi_aws as aws

# Create a security group allowing inbound SSH (22) traffic
sec_grp = aws.ec2.SecurityGroup(
    "server-secgrp",
    description="Enable SSH access",
    ingress=[{
        "protocol": "tcp",
        "from_port": 22,
        "to_port": 22,
        "cidr_blocks": ["0.0.0.0/0"],
    }],
)

# Fetch the latest Amazon Linux 2 AMI
ami_info = aws.ec2.get_ami_output(
    most_recent=True,
    owners=["amazon"],
    filters=[
        {"name": "name", "values": ["amzn2-ami-hvm-*-x86_64-gp2"]},
        {"name": "virtualization-type", "values": ["hvm"]}
    ]
)

# Launch an EC2 instance
server = aws.ec2.Instance(
    "basic-ec2-server",
    instance_type="t2.micro",
    ami=ami_info.id,
    security_groups=[sec_grp.name],
)

# Export public IP and DNS
pulumi.export("publicIp", server.public_ip)
pulumi.export("publicDns", server.public_dns)