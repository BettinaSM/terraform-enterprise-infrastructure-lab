terraform {
  required_version = ">= 1.0"
}

provider "google" {
  project = "demo-project"
  region  = "us-central1"
}

resource "google_compute_network" "vpc_network" {
  name = "enterprise-network"
}

resource "google_storage_bucket" "logs_bucket" {
  name     = "enterprise-security-logs"
  location = "US"
}
