terraform {
  backend "gcs" {
    bucket = "bucketterraformcoursetfstate"
    prefix = "terraform/state"
  }
}