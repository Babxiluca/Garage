
variable "tags_project" {
  type = object({
    name = string
    location = string
    project = string
  })

  default = {
    "name" = "gcp_project-1",
    location = "us-west-1-${var.location}"
    "project" = "proyecto-x"
  }
  
}