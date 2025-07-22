# End-to-End Testing Plan: 3-Tier VPC Architecture

## Architecture:
- **Tier 1**: Load Balancer (Public Subnet)
- **Tier 2**: App Servers (Private Subnet)
- **Tier 3**: Database (Private Subnet + NACLs)

## Goals:
- Validate connectivity, isolation, and performance across layers

---

## Test Steps:

1. **Provision VPC + Subnets**
2. **Deploy EC2 instances** in each subnet
3. **Attach ALB** to public subnet
4. **Add security groups + NACLs**
5. **Send test HTTP traffic**

---

## Validation Points:

| Layer     | Validation                                  |
|-----------|---------------------------------------------|
| Network   | Ping from LB → App → DB                     |
| Security  | App cannot be accessed directly from public |
| Routing   | Traffic passes correctly through NAT/GW     |
| Performance | Response time < 500ms under load         |
| Logging   | Ensure flow logs and CloudWatch logs work   |
