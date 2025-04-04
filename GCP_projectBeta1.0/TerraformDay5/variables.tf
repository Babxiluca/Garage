variable "nomeofBucket" {
    description = "Nombre del bucket"
    type = string
    default = "nahumponcebuckettest"
  
}

# variable "location" {
# description = "location name"
#   type = string
#   default = "EU"
# }

variable "computengine" {
    type = string
    default = "babxilu-dummy"
  
}

variable "project-id" {
  type = string
  default = "acn-atcm-devops-gcp"
}

variable "KindMachine" {
  type = string
  default = "e2-micro"
}

variable "tags_project" {
  type = object({
    name = string
    project = string
    location = string
  })

  default = {
    "name" = "gpc_demo",
    "project" = "terraform",
    "location" = "EU"

  }


}
