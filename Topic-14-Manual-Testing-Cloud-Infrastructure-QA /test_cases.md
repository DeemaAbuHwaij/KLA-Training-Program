# VPC Test Cases

| ID  | Description                        | Steps                                                                 | Expected Result                                      | Category   | Priority |
|-----|------------------------------------|-----------------------------------------------------------------------|------------------------------------------------------|------------|----------|
| TC1 | Create VPC with valid /16 CIDR     | Use CIDR `10.0.0.0/16`                                               | VPC is created successfully                          | Positive   | High     |
| TC2 | Create VPC with smallest valid /28 | Use CIDR `10.0.0.0/28`                                               | VPC is created successfully                          | Boundary   | Medium   |
| TC3 | Create VPC with invalid CIDR       | Use CIDR `10.300.0.0/16`                                             | System returns error for invalid CIDR                | Negative   | High     |
| TC4 | Create VPC with blank name         | Leave VPC name empty                                                 | System prompts error: name required                  | Negative   | Medium   |
| TC5 | Create VPC with max name length    | Use 255-character name                                               | VPC created successfully                             | Boundary   | Low      |
| TC6 | Create VPC with overlong name      | Use name > 255 characters                                            | Error: "Name too long"                               | Negative   | Low      |
| TC7 | Delete existing VPC                | Select and delete existing VPC                                      | VPC deleted successfully                             | Positive   | High     |
| TC8 | Delete non-existent VPC            | Use invalid VPC ID and send delete request                          | Error: "VPC not found"                               | Negative   | Medium   |
| TC9 | List all VPCs                      | Click "List VPCs" or GET `/vpcs`                                    | Returns list of all VPCs                             | Positive   | Medium   |
| TC10| Create duplicate CIDR VPCs         | Try to create multiple VPCs with same CIDR                          | Error or conflict message                            | Negative   | High     |
