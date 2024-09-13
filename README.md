# Vertex AI Workbench Instance Creation with Terraform and GitHub Actions

## Objective:​

- Create workbench instances for 10 users using terraform​

- Each instance will be owned by a specific user (using email as identifier).​

- Automate workbench creation process with Github Actions​

## Infrastructure:​

- Requirements:
    - Backend: a Google Cloud Storage bucket
    - Network: a VPC network with a subnet

![GitHub Action Flow](./infra/GA_Flow.jpg)

## Components

### Vertex AI Work​bench Instance​s

- 10 instances
- Assign user-specific ownership using email as identifier

### Terraform

- Centralized terraform script for workbench instances creation​.

- Each user will have a separate tfvars file with parameters:
    - `user_email`
    - `username`
    - `isDeleted`
      - `true`: Destroy the instance if exist
      - `false`: Create the instance if not exist

- Terraform state files: using `terraform workspace` to create separate workspace and state files for each user.

### Github Actions

- Automate the workbench creation process using Github Actions
- Trigger the workflow on `pull request` `close` event on the `main` branch.
- Jobs:
    - if_merged: Check if the `pull request` is merged to the `main` branch.
    - generate-matrix: Generate a matrix with multiple users.
    - terraform: Run terraform script for each user (in parallel by default). 

## Advantages

- **Efficiency**: Automate the workbench creation process with Github Actions and Terraform --> save time and effort required to provision workbench instances manually.
- **Consistency**: Standardize the workbench creation process for all users --> reduce human errors.
- **Scalability**: 
  - Easily scale the workbench creation process for multiple users --> add more users by new tfvars files.
  - Separate workspace and state files for each user --> avoid conflicts between users.
- **Version Control and Collaboration**: 
  - Track changes to the infrastructure code using version control (GitHub).
  - Collaborate with team members by creating pull requests and reviewing changes before merging to the main branch.
  - CI/CD pipeline with Github Actions --> automate the testing and deployment process.

## Limitations

- **tfvars files**: Large number of tfvars files may be difficult to manage manually.
- **state files**: Large number of state files may be difficult to manage manually.
- **Github Actions**: Workflow complexity may increase with large number of users.
- **Quotas**: Put all the users in the same project may hit the quotas limit or Regional availability.