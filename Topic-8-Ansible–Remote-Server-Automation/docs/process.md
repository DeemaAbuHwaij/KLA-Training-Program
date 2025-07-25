# Topic 8: Ansible – Remote Server Automation (Azure Edition)

## What Was Done
- Created an Ubuntu VM on Azure (`westeurope` region)
- Wrote an Ansible playbook to:
  - Install Apache
  - Deploy a custom index page
- Used a Jinja2 template for dynamic content

## Files
- `inventory.ini`: Target VM details
- `playbook.yml`: Playbook for Apache + web page
- `index.html.j2`: Custom template with dynamic hostname
- `process.md`: Documentation

## Outcome
Apache was installed and deployed to:  
**http://135.236.11.16**

## Learnings
- Ansible inventory and SSH
- Modules: `apt`, `service`, `template`
- Jinja2 templating for dynamic pages
- Troubleshooting Azure quota & image issues
