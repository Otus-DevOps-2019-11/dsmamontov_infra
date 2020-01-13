provider "google" {
  version = "~> 2.15"
  project = var.project
  region  = var.region
}

module "storage-bucket" {
  source        = "SweetOps/storage-bucket/google"
  version       = "0.3.0"
  name          = "storage-bucket-pearl4003"
  location      = "europe-west1"
  force_destroy = true
}

output storage-bucket_url {
  value = module.storage-bucket.url
}
