## Install
Install Terraform

* [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli#install-terraform) 

Install HashiCorp Terraform VSCode Instructions

* [HashiCorp Terraform](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform)

We'll mostly be using AWS as the primary provider, but bellow are the other 2 principla providers. If you want to follow along for all labs you'll need accounts for:

- [Google Cloud Platform (GCP)](https://cloud.google.com)

Google Cloud SDK

## Getting Started

### First Module ###

We are going to learn the basics of Terraform:

| Name | Definition | Configuration Hints | Addicional |
|------|------------|---------------------|:----------:|
| [https://developer.hashicorp.com/terraform/tutorials/cli/init] | Creating main.tf |   | addicional |
| [https://registry.terraform.io/browse/providers] | Add GCP Provider |  | na |
| [https://registry.terraform.io/providers/hashicorp/aws/latest/docs] | Generate and configure GCP credentials |  |  |
| [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance] | Configure an GCP Virtual Machine | na  | na |
| [https://developer.hashicorp.com/terraform/tutorials/cli/init] | Initialize terraform project-Terraform init | Initialize and Pull the providers and modules and provisioners if any| You can see created new folder .Terraform and .terraform.lock.hcl|
| [https://developer.hashicorp.com/terraform/cli/commands/fmt] | Terraform fmt | Fix the identation onto the file | na |
| [https://developer.hashicorp.com/terraform/cli/commands/validate] | Terraform validate | validates the configuration files in a directory | na |
| [https://developer.hashicorp.com/terraform/tutorials/cli/plan] | Terraform plan | creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure |  |
| [https://developer.hashicorp.com/terraform/tutorials/cli/apply] | Terraform apply | executes the actions proposed in a Terraform plan to create, update, or destroy infrastructure | na|
| [https://developer.hashicorp.com/terraform/tutorials/cli/apply]| Terraform apply (updating) |  reads the current settings from all managed remote objects and updates the Terraform state to match | na |
| [https://developer.hashicorp.com/terraform/language/values/locals][] | Set Locals and interpolations |  | na |
| [https://developer.hashicorp.com/terraform/language/values/outputs][] | Create Outputs |  | na |
| [https://developer.hashicorp.com/terraform/cli/commands/refresh][] | Terraform refresh |  reads the current settings from all managed remote objects and updates the Terraform state to match | na |
| [https://developer.hashicorp.com/terraform/language/values/outputs][] | Terraform output |  | na |
| [https://developer.hashicorp.com/terraform/cli/commands/destroy][] | Terraform destroy | is a convenient way to destroy all remote objects managed by a particular Terraform configuration | na |
