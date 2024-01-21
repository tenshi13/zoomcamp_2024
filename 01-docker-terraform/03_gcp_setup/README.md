# Gist
- need to setup terraform and gcp to provision environments
- copied files from https://github.com/DataTalksClub/data-engineering-zoomcamp/tree/main/01-docker-terraform/1_terraform_gcp/terraform/terraform_with_variables
- gcp
  - need to create service account, and download thre api token .json file
    - Left menu -> APIs & Services -> Credentials -> Create Credentials -> Service Account
    - follow the prompts/steps, once created will get redirected to IAM & Admin -> Service Accounts -> Account Details
    - on the top menu click -> KEYS -> ADD KEY -> NEW KEY -> JSON
    - will be presented with key to download
  - need to follow below code:

```shell
# adds account api token to GCP recognized environment variable
export GOOGLE_APPLICATION_CREDENTIALS="../../zoomcamp1.json" # path to downloaded json key

# Refresh service-account's auth-token for this session
gcloud auth application-default login

# Initialize state file (.tfstate)
terraform init

# Check changes to new infra plan
terraform plan -var="project=<your-gcp-project-id>"
```

```shell
# Create new infra
terraform apply -var="project=<your-gcp-project-id>"
```

```shell
# Delete infra after your work, to avoid costs on any running services
terraform destroy
```
