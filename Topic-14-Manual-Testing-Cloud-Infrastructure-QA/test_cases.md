# VPC Test Cases 

## TC1 – Create a VPC with valid CIDR block
- **Steps:** Go to VPC → Create → Set CIDR `10.0.0.0/16`
- **Expected Result:** VPC is created successfully
- **Category:** Positive  
- **Priority:** High  

---

## TC2 – Create a VPC with CIDR `/28`
- **Steps:** Go to VPC → Create → Set CIDR `10.0.1.0/28`
- **Expected Result:** VPC is created successfully
- **Category:** Boundary  
- **Priority:** Medium  

---

## TC3 – Create a VPC with CIDR `/16`
- **Steps:** Go to VPC → Create → Set CIDR `172.16.0.0/16`
- **Expected Result:** VPC is created successfully
- **Category:** Boundary  
- **Priority:** Medium  

---

## TC4 – Create VPC with invalid CIDR
- **Steps:** Go to VPC → Create → Set CIDR `10.0.0.300/16`
- **Expected Result:** Error: invalid CIDR block
- **Category:** Negative  
- **Priority:** High  

---

## TC5 – Create VPC with blank name
- **Steps:** Go to VPC → Create → Leave name field blank
- **Expected Result:** Error: name is required
- **Category:** Negative  
- **Priority:** Medium  

---

## TC6 – Create VPC with overly long name
- **Steps:** Go to VPC → Create → Name: `aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa`
- **Expected Result:** Error: name exceeds character limit
- **Category:** Negative  
- **Priority:** Low  

---

## TC7 – Delete existing VPC
- **Steps:** Go to VPC list → Select → Delete
- **Expected Result:** VPC is deleted
- **Category:** Positive  
- **Priority:** High  

---

## TC8 – Create duplicate VPC with same CIDR
- **Steps:** Create VPC with CIDR `10.0.0.0/16` twice
- **Expected Result:** Error: CIDR already in use
- **Category:** Negative  
- **Priority:** Medium  

---

## TC9 – Tag VPC during creation
- **Steps:** Go to VPC → Create → Add tags `env=dev`
- **Expected Result:** VPC is created with correct tags
- **Category:** Positive  
- **Priority:** Low  

---

## TC10 – List all VPCs
- **Steps:** Go to VPC dashboard
- **Expected Result:** All created VPCs are listed correctly
- **Category:** Positive  
- **Priority:** Low  
