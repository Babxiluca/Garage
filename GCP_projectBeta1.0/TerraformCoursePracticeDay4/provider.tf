terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.10.0"
    }
  }
}

provider "google" {
  project = "acn-atcm-devops-gcp"
  region  = "us-central1"
  zone    = "us-central1-c"
}