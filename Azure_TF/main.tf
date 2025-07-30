
data "azurerm_resource_group" "terraform_azure_providers" {
  name = "terraform-learning-lab"
  #location = "eastus"
  #id = "5156f0c3-0314
} 

resource "azurerm_resource_group" "tatat" {
  #### configuration
  
  lifecycle {
    create_before_destroy = true
  }

}
resource "azurerm_storage_account" "laterraform" {
  count = 2
  name                     = "babxilucat-${count.index}"
  resource_group_name      = data.azurerm_resource_group.terraform_azure_providers.name
  location                 = data.azurerm_resource_group.terraform_azure_providers.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "contlabterra" {
  depends_on = [ 
    azurerm_storage_account.laterraform[0]
   ]
  name                  = "terracontenedor"
  storage_account_id    = azurerm_storage_account.laterraform.id
  container_access_type = "private"
}
# 
# resource "azurerm_storage_blob" "blobyterraform" {
  # name                   = "my-awesome-content.zip"
  # storage_account_name   = azurerm_storage_account.laterraform.name
  # storage_container_name = azurerm_storage_container.contlabterra.name
  # type                   = "Block"
# }

resource "azurerm_service_plan" "servicex" {
  name                = "example-app-service-plan"
  resource_group_name = data.azurerm_resource_group.terraform_azure_providers.name
  location            = data.azurerm_resource_group.terraform_azure_providers.location
  os_type             = "Linux"
  sku_name            = var.service_plan_tipo
}


resource "azurerm_linux_function_app" "example" {
  name                = "certeficatetu"
  resource_group_name = data.azurerm_resource_group.terraform_azure_providers.name
  location            = data.azurerm_resource_group.terraform_azure_providers.location

  storage_account_name       = azurerm_storage_account.laterraform.name
  storage_account_access_key = azurerm_storage_account.laterraform.primary_access_key
  service_plan_id            = azurerm_service_plan.servicex.id
  https_only = true
  tags =  {
     project = "laboratoriotf"
     environment = "beta"
     version = "1"
     team = "SME-PROGRAM"
  }
  

  site_config {}


}


resource "azurerm_storage_blob" "blobyterraform" {
  for_each = local.blob_names
  name                   = each.value
  storage_account_name   = azurerm_storage_container.contlabterra.name
  storage_container_name = azurerm_storage_container.contlabterra.name
  type                   = "Block"
}


locals {
   blob_names = {
     Dev = "my-awesome-content.zip-Dev/file1.txt"
     Test = "my-awesome-content.zip-test/file2.txt"
   }
 }



# 
# variable "ciudades" {
  # type = list
  # default = ["myt","acapulco"]
# }
# 
# variable "memmerships" {
  # type = map 
  # default = {
    # "PlanSilver" = "500"
    # "PlanGold" = "10000"
  # }
# }
# 
# variable "aleatorio" {
  # type = tuple([string,number,bool  ])
  # default = ["cash","50","234123"]  
# }
# 

# module "avm-res-network-virtualnetwork" {
  # source = "Azure/avm-res-network-virtualnetwork/azurerm"
  # version = ">= 0.9.0"

  # address_space       = ["10.0.0.0/16"]
  # location            = "East US"
  # name                = "myVNet"
  # resource_group_name = azurerm_network_security_group.terraformlab.name
  # subnets = {
    # "subnet1" = {
      # name             = "subnet1"
      # address_prefixes = ["10.0.0.0/24"]
    # }
    # "subnet2" = {
      # name             = "subnet2"
      # address_prefixes = ["10.0.1.0/24"]
    # }
  # }
  # 
