https://roadmap.sh/projects/iac-digitalocean

### Preparing
1. Install Terraform:
```
curl -o ~/terraform.zip https://releases.hashicorp.com/terraform/1.1.3/terraform_1.1.3_linux_amd64.zip
```
2. Unzip terraform installation files:
```
unzip ~/terraform.zip -d ~/opt/terraform
```
2. Add terraform to your PATH:
```
echo "export PATH=$PATH:~/opt/terraform" >> ~/.bashrc
```
2. Source bashrc:
```
. ~/.bashrc
```
2. Create Digital Ocean Personal Access Token (needed for API usage)
https://docs.digitalocean.com/reference/api/create-personal-access-token/
3. Create env variable with your PAT:
```
export DO_PAT="your_personal_access_token"
```
4. Find your ssh key name in your Digital Ocean profile and change `<YOUR_SSH_KEY_NAME_IN_DO_PROFILE>` in all files in this repo to it

### Running

1. Initialize Terraform:
```
terraform init
```
2. Create an execution plan:
```
terraform plan \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=$HOME/.ssh/id_rsa"
```
`pvt_key` - location of an ssh key you added in your Digital Ocean profile
3. Apply an execution plan:
```
terraform apply \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=$HOME/.ssh/id_rsa"
```
4. You can check current state of your infrastructure:
```
terraform show terraform.tfstate
```

### Keeping up-to-date

1. Refresh plan if you want to roll back some changes made outside of Terraform:
```
terraform refresh \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=$HOME/.ssh/id_rsa"
```

### Deleting

1. Generate plan for destruction:
```
terraform plan -destroy -out=terraform.tfplan \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=$HOME/.ssh/id_rsa"
```
2. Apply the plan:
```
terraform apply terraform.tfplan
```
