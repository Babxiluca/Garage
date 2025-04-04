locals {
  image-id = {family  = "debian-12", project = "debian-cloud"}
  image-id2 = {family  = "debian-12", project = "debian-cloud"}
  image-id3 = {family  = "debian-12", project = "debian-cloud"}
}

locals {
  zone1 = {zone = "us-central1-a"}
  zone2 = {zone = "us-central1-b"}
  zone3 = {zone = "us-central1-c:wq"}
}