// Provider configuration
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.30.0"
    }
  }
}

provider "google" {
  //  credentials = var.credentials
  region  = "asia-southeast2"
  zone    = "asia-southeast2-a"
  project = "terraform-learn-369718"
}

resource "google_compute_instance" "myvm" {
  name         = "instance-1"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = "default"
    subnetwork = "default"
    access_config {
    }
  }

  # service_account {
  #   email = "xxxredactedxxx"
  #   scopes = [
  #     "https://www.googleapis.com/auth/devstorage.read_only",
  #     "https://www.googleapis.com/auth/logging.write",
  #     "https://www.googleapis.com/auth/monitoring.write",
  #     "https://www.googleapis.com/auth/service.management.readonly",
  #     "https://www.googleapis.com/auth/servicecontrol",
  #     "https://www.googleapis.com/auth/trace.append"
  #   ]
  # }
}