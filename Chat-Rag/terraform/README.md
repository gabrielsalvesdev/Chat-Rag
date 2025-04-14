# Chat RAG Terraform Configuration

## Prerequisites
- Azure CLI installed
- Terraform installed
- Azure Service Principal created

## Setup Steps

1. **Create Service Principal**
   

2. **Configure Credentials**
   - Replace values in `terraform.tfvars`:
     - `subscription_id`: Your Azure Subscription ID
     - `tenant_id`: Azure Tenant ID
     - `client_id`: Service Principal App ID
     - `client_secret`: Service Principal Password

3. **Initialize Terraform**
   
[0m[1mInitializing the backend...[0m

[0m[1mInitializing provider plugins...[0m
- Reusing previous version of hashicorp/azurerm from the dependency lock file

4. **Plan Deployment**
   

5. **Apply Configuration**
   

## Notes
- Keep `terraform.tfvars` private
- Do not commit credentials to version control
