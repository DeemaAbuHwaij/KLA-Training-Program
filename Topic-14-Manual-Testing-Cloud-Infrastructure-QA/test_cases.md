# VPC Test Cases

| ID  | Description                              | Steps                                                                 | Expected Result                            | Category  | Priority |
|-----|------------------------------------------|-----------------------------------------------------------------------|--------------------------------------------|-----------|----------|
| TC1 | Create a VPC with valid CIDR block       | Go to VPC → Create → Set CIDR `10.0.0.0/16`                          | VPC is created successfully                 | Positive  | High     |
| TC2 | Create a VPC with CIDR `/28`             | Go to VPC → Create → Set CIDR `10.0.1.0/28`                          | VPC is created successfully                 | Boundary  | Medium   |
| TC3 | Create a VPC with CIDR `/16`             | Go to VPC → Create → Set CIDR `172.16.0.0/16`                        | VPC is created successfully                 | Boundary  | Medium   |
| TC4 | Create VPC with invalid CIDR `10.0.0.300`| Go to VPC → Create → Set CIDR `10.0.0.300/16`                        | Error: invalid CIDR block                   | Negative  | High     |
| TC5 | Create VPC with blank name               | Go to VPC → Create → Leave name field blank                          | Error: name is required                     | Negative  | Medium   |
| TC6 | Create VPC with overly long name         | Go to VPC → Create → Name: `aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa`   | Error: name exceeds character limit         | Negative  | Low      |
| TC7 | Delete existing VPC                      | Go to VPC list → Select → Delete                                     | VPC is deleted                              | Positive  | High     |
| TC8 | Create duplicate VPC with same CIDR      | Create VPC with CIDR `10.0.0.0/16` twice                             | Error: CIDR already in use                  | Negative  | Medium   |
| TC9 | Tag VPC during creation                  | Go to VPC → Create → Add tags `env=dev`                              | VPC is created with correct tags            | Positive  | Low      |
| TC10| List all VPCs                            | Go to VPC dashboard                                                  | All created VPCs are listed correctly       | Positive  | Low      |