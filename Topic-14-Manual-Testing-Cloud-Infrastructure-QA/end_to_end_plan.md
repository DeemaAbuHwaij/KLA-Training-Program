# End-to-End Test Plan – 3 Tier VPC Architecture

## Scenario
Test a full deployment in a VPC:
- Load Balancer (LB)
- Application Layer (App)
- Database Layer (DB)

## Steps
1. Create VPC with CIDR `10.0.0.0/16`
2. Create subnets:
   - Public for LB (`10.0.1.0/24`)
   - Private for App (`10.0.2.0/24`)
   - Private for DB (`10.0.3.0/24`)
3. Launch:
   - LB instance (Nginx)
   - App instance (Node.js or Python)
   - DB instance (MySQL)
4. Configure routing and security groups
5. Access LB via public IP

## Validation Points
- Connectivity:
  - LB can reach App
  - App can reach DB
- Security:
  - Only port 80 open on LB
  - DB not publicly accessible
- Performance:
  - App responds < 500ms under load
  - No dropped connections