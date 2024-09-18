## Install
Install Terraform

* [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli#install-terraform) 

Install HashiCorp Terraform VSCode Instructions

* [HashiCorp Terraform](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform)

We'll mostly be using AWS as the primary provider, but bellow are the other 2 principla providers. If you want to follow along for all labs you'll need accounts for:

- [Amazon Web Services (AWS)](https://aws.amazon.com/)
- [Microsoft Azure](https://azure.microsoft.com)
- [Google Cloud Platform (GCP)](https://cloud.google.com)

AWS CLI
Azure CLI
Google Cloud SDK

## Getting Started

### First Module ###

We are going to learn the basics of Terraform:

| Name | Definition | Configuration Hints | Addicional |
|------|------------|---------------------|:----------:|
| [https://developer.hashicorp.com/terraform/tutorials/cli/init] | Creating main.tf |   | addicional |
| [https://registry.terraform.io/browse/providers] | Add AWS Provider |  | na |
| [https://registry.terraform.io/providers/hashicorp/aws/latest/docs] | Generate and configure AWS credentials |  |  |
| [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance] | Configure an AWS Virtual Machine | na  | na |
| [https://developer.hashicorp.com/terraform/tutorials/cli/init] | Initialize terraform project | na| na |
| [https://developer.hashicorp.com/terraform/cli/commands/fmt] | Terraform fmt | depends_on buckent ownerhsip creation | na |
| [https://developer.hashicorp.com/terraform/cli/commands/validate] | Terraform validate | na | na |
| [https://developer.hashicorp.com/terraform/tutorials/cli/plan] | Terraform plan | |  |
| [https://developer.hashicorp.com/terraform/tutorials/cli/apply] | Terraform apply |  | na|
| [https://developer.hashicorp.com/terraform/tutorials/cli/apply]| Terraform apply (updating) | na | na |
| [https://developer.hashicorp.com/terraform/language/values/locals][] | Set Locals and interpolations |  | na |
| [https://developer.hashicorp.com/terraform/language/values/outputs][] | Create Outputs |  | na |
| [https://developer.hashicorp.com/terraform/cli/commands/refresh][] | Terraform refresh |  | na |
| [https://developer.hashicorp.com/terraform/language/values/outputs][] | Terraform output |  | na |
| [https://developer.hashicorp.com/terraform/cli/commands/destroy][] | Terraform destroy |  | na |



### First Module ###
- Creating main.tf - 2 min
- Add AWS Provider - 5 min 
- Generate and configure AWS credentials - 5 min    
- Configure an AWS Virtual Machine - 5 min 
- Initialize terraform project - 5 min
- Terraform fmt - 3 min
- Terraform validate - 3 min
- Terraform plan - 3 min
- Terraform apply - 5 min 
- Terraform apply (updateing) - 5 min 
- Create Input Variables - 5 min 
- Set Locals and interpolations - 5 min 
- Create Outputs - 5 min
- Terraform refresh - 1 min
- Terraform output - 1 min
- Terraform destroy - 1 min

### Second Module ###
- Divide project into multiple files
- Terraform Data
- Use local- Exec
- Remote - Exec
- Null resource
- Terraform Module

- Create a Terraform Cloud workspace
- Migrate local to remote workspace
- Move AWS Credentials to Env Vars

## Provisioners

- Cloud-Init
- Local Exec
- Remote Exec
- File
- Connection
- Null Resource and Trigger

## Providers

- Provision AWS Resource
- Provision Azure Resource
- Provision GCP Resource


## Terraform Registry


## Variables and Outputs

- terraform.tfvars
- additional variable files and -var-file
- additional autoloaded files
- -var
- TF_VAR_
- Ouputs CLI
- Chaining outputs from a module
- Local values
- Data Sources

## Resource Meta Arguements

- depends_on
- count
- for_each
- provider and alias
- lifecycle

## Expressions

- String Templates
- For Expressions
- Splats
- Dynamic Blocks
- Versions Constraints

## Terraform State
- terraform state list
- terraform state mv
- terraform state show
- terraform state mv

## Plan and Apply

- Speculative Plans
- Saved Plans

## Manage Resource Drift

- Replace
- Import
- Refresh

## Troubleshooting

- Terraform Log
- Terraform Crash log

## Modules

- Create a module

## Terraform Workflows

- individual Terraform Workflow

## Backends

- Standard Backend with Amazon S3
- Remote backend multiple workspaces
- terraform_remote_state local
- terraform_remote_state remote
- force-unlock

## Resources

- collection types
- structual typeear

## Functions

- Built In Functions

## Workspaces

- Multiple workspaces Terraform Cloud

