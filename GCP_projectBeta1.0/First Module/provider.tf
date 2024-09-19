##Add provider ###

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.84.0"
    }
  }
}

provider "google" {
  credentials = "terraform-gcp-example-326401-042e1f1dc62c.json"
	project = "terraform-gcp-example-326401"
	region = "us-central1"
	zone = "us-central1-c"
}