resource "azurerm_role_assignment" "iners" {
  for_each = {
    for container_key, container_value in local.cont_mi : 
    container_key => {
      roles = local.ge-g-dev[container_key].role_name
    } if container_key != "raw" && contains(keys(local.ge-g-dev), container_key)
  }
  scope                = module.Da[each.key].resource_manager_id
  role_definition_name = tostring(each.value.roles) # Convertir el set a string
  principal_id         = local.aa.applications["gemdev"].principal_id
}


locals {
  cont_mi = {
    raw                      = { type = "blob", access_type = "private" },
    edi-boomi-declaration    = { type = "blob", access_type = "private" }
    boomi-customs-submission = { type = "blob", access_type = "private" }
    boomi-customs-response   = { type = "blob", access_type = "private" }
  }
}

locals {
    ge-g-dev = {
    blob_storage_account = {
      role_name = toset(["Storage Blob Data Reader"])
    }
    event_hub_receiver = {
      role_name = toset(["Azure Event Hubs Data Receiver"])
    }
    event_hub_sender = {
      role_name = toset(["Azure Event Hubs Data Sender"])
    }
    blob_container = {
      role_name = toset(["Storage Blob Data Contributor"])
    }
    boomi_container = {
      role_name = toset(["Storage Blob Data Contributor"])
    }
  } 
}


runs-on: ${{matrix.os}}
    strategy:
      matrix:
        os: [obuntu-latest, windows-latest, macOS-latest]

on:
  schedule:
    - cron: "* * * * "
            min,hora, dia, mes 

          resource "azurem_role_assigment" "roles azr"
            for_each = {
               for containers_key, container_value in local.containers_boomi:
               container_key => {
                 roles = {
                    for role_key, role_value in loca.emini.dev.boomi_containers.role_name:
                    role_key => role_value
                 }
               } if container_key != "raw"

            }
            scope: = module.datalike.blob_containers[each.key].resource.id

The source name for a provider is the following format: [/]/
What happens when no host name is provided eg:

terraform {
   required_providers {
    mycloud = { 
      source = "mycorp/mycloud"                  
      version = "~> 1.0"            
    }     
  }
}

resource "null" "cluster" {
    #...
}  

var "image_id" {
  type = string
}

	
resource "aws_instance" "example1" {
  ami = aws_instance.example.ami.id
}

The following is a valid configuration for a provider?

terraform {
  required_providers{
    aws = {
      source = "hashicorp/aws"
      version = "3.59.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

The following data source is set.

data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "hashicorp"
    workspaces = {
      name = "vpc-dev"
    }
  }
}
How would it be referenced within a resource?

What type of backend is this Terraform configuration file using?

terraform {
}

provider "aws" {
  region = "us-east-1"
  profile = "sandbox"
}

resource "aws_instance" "ExampServer" {
  ami           = "ami-0c2b8ca1dad557g8a"
  instance_type = "t2.nano"
  tags = {
    Name = "ExampServer"
  }
}

When running terraform fmt what changes will occur to the configuration file?

resource "aws_instance" "my_example_server"
{
  ami           = "INVALID_AMI_VALUE"
  instance_type = "t2.nano"
}

Is this a valid configuration for remote-exec?

resource "aws_instance" "web" {
  # ...

  provisioner "remote-exec" {
    inline = [
      "puppet apply",
      "consul join ${aws_instance.web.private_ip}",
    ]
   interpreter = ["bash", "-e"]
  }
}