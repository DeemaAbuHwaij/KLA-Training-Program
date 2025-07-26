# Bug Reports

---

### Bug 1 – DNS Resolution Fails for New VPC

- **Description**: New VPC DNS resolution not working.
- **Steps**:
  1. Create a new VPC with default settings.
  2. Launch EC2 inside it.
  3. Try DNS lookup inside the instance.
- **Expected**: Internal DNS resolution should work.
- **Actual**: Fails to resolve names (e.g., `ping google.com` fails).
- **Severity**: High

---

### Bug 2 – CIDR Validation Error Missing

- **Description**: CIDR block `10.0.0.300/16` accepted by system.
- **Steps**:
  1. Go to VPC create.
  2. Enter CIDR `10.0.0.300/16`.
- **Expected**: Should show validation error.
- **Actual**: CIDR accepted and creation proceeds.
- **Severity**: Critical

---

### Bug 3 – VPC Creation Failure With Tags

- **Description**: Creating VPC with tag `env=prod` fails.
- **Steps**:
  1. Create VPC → Add tag `env=prod`.
- **Expected**: VPC should be created with tag.
- **Actual**: “Internal Error” shown.
- **Severity**: Medium