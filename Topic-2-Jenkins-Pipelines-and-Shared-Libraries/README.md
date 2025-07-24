# Topic 2: Jenkins Pipelines and Shared Libraries

## What You’ll Learn
- Differences between Declarative and Scripted Pipelines
- Jenkinsfile structure: agent, stages, parameters, environment, post
- Reusing code with shared libraries
- Working with the Polybot project

##  Tasks
- Download and review the original Jenkinsfile
- Refactor the deploy stage to `vars/deploy.groovy`
- Add parameters: `SERVICE_NAME`, `IMAGE_FULL_NAME_PARAM`
- Create a Jenkins job and run builds with different parameter values
- Upload the shared library to GitHub

## Deliverables
- A clean Jenkinsfile referencing the shared library
- `deploy.groovy` in `vars/` with documented logic
- This README
- A README for the shared library

## References
- Jenkins Shared Libraries: https://www.jenkins.io/doc/book/pipeline/shared-libraries/
- Jenkins Pipeline Syntax: https://www.jenkins.io/doc/book/pipeline/syntax/