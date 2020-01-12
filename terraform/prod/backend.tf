terraform {
  backend "gcs" {
    bucket = "storage-bucket-pearl4003"
    prefix = "terraform/state/prod"
  }
}
