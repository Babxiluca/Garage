
variable "service_plan_tipo" {
  type = string
  description = " Tipo de plan de la function"
   
}

variable "all_tags" {
    type = map(any)
  
}
# 
# 
# locals {
#    blob_names = {
    #  Dev = "my-awesome-content.zip-Dev"
    #  Test = "my-awesome-content.zip-test"
#    }
#  }