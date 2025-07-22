# Bug Reports – VPC Management System

---

## 🐞 Bug 1: DNS Resolution Failure

**Description**: DNS records for newly created VPC subnets are not resolving.  
**Steps to Reproduce**:
1. Create a VPC and enable DNS resolution
2. Launch an instance inside the VPC
3. Attempt to resolve instance hostname

**Expected**: Hostname resolves to internal IP  
**Actual**: DNS resolution fails  
**Severity**: High

---

## 🐞 Bug 2: Invalid CIDR Not Rejected

**Description**: System accepts CIDR blocks with octets > 255  
**Steps to Reproduce**:
1. Submit CIDR: `10.999.0.0/16`  
2. Click create VPC

**Expected**: Error validation  
**Actual**: VPC is created with invalid configuration  
**Severity**: Critical

---

## 🐞 Bug 3: VPC Creation Timeout

**Description**: Creating a new VPC intermittently hangs for >60 seconds  
**Steps to Reproduce**:
1. Open VPC creation form
2. Fill in valid CIDR and name
3. Click “Create VPC”

**Expected**: Creation completes within 5–10 seconds  
**Actual**: Operation hangs indefinitely  
**Severity**: Medium
