resource "google_compute_network" "vpc_network" {
  name                    = "our-custom-mode-network"
  auto_create_subnetworks = false
  mtu                     = 1480
}

resource "google_compute_subnetwork" "default" {
  name          = "my-custom-subnet-states"
  ip_cidr_range = var.ip_cidr_range
  region        = "us-west2"
  network       = google_compute_network.vpc_network.id
}
