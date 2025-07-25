# Topic 8: Ansible – Remote Server Automation

## What You’ll Learn
- Running Ansible Playbooks to automate server configuration
- Writing automation tasks using Ansible modules and Jinja2 templates
- Defining and using inventories to manage host groups

---

## Tasks

1. Read Alon’s Ansible guide (link below)
2. Run a Playbook that installs Apache on a remote server
3. Add a Jinja2 template for a custom index.html page

---

## Project Structure

```
Topic-8-Ansible-Remote-Server-Automation/
├── inventory.ini              # Inventory file with remote VM details
├── playbook.yml              # Main Ansible playbook
├── templates/
│   └── index.html.j2         # Jinja2 template for Apache index page
├── docs/
│   └── process.md           
├── ansible-screenshot.png
├── README.MD
```

---

## How to Run

```bash
ansible-playbook -i inventory.ini playbook.yml
```

> Make sure the target VM is accessible via SSH and port 80 is open on Azure.

---

## Expected Result

When visiting the public IP of your Azure VM, you should see:

```
Hello from ansible-vm
Apache was deployed with Ansible on Azure 
```

---

## References

- [Alon's Ansible Guid](https://github.com/alonitac/Fursa25/tree/main/ansible_workdir)