resource "google_storage_bucket" "static-site" {
  name          = var.nomeofBucket
  location      = local.location
  storage_class = "STANDARD"

  uniform_bucket_level_access = true
}


# locals {
#   location = "EU"
#   machine_type = var.computengine
# }

locals {
  zone1 = ["us-central1-a", "us-central1-b", "us-central1-c"]
  # zone2 = {zone = "us-central1-b"}
  # zone3 = {zone = "us-central1-c:wq"}
}

data "google_compute_image" "debian" {
  family  = "debian-12"
  project = "debian-cloud"
}

##Create a compute engine###
resource "google_compute_instance" "vm_instance" {
  for_each =  {
    for zona in local.local.zone1
  }  
    name         = var.computengine
  machine_type = 
  zone = 

  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian.self_link
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.id
    access_config { }
  }
}

# Creación de una VPC
resource "google_compute_network" "vpc_network" {
  project                 = var.project-id
  name                    = "vpc-network"
  auto_create_subnetworks = true
}
