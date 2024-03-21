module "backend_bucket" {
  source = "./bucket"

  name = "dos18-states-storek2343284efdsfdsklfjldskfjkldsfjkdsj"
  kms_key = google_kms_crypto_key.cryptokey-state-bucket.id
}


module "default_network" {
  source = "./network"
}

data "google_compute_image" "debian_image" {
  family  = "debian-11"
  project = "debian-cloud"
}

locals {
  debian_image_latest = data.google_compute_image.debian_image
}

output "debian_image" {
  value = local.debian_image_latest
}



resource "google_compute_instance" "default" {
  count = var.vm_count

  name         = "my-instance-${count.index + 1}"
  machine_type = "n2-standard-2"
  zone         = "us-west2-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian_image.id
      labels = {
        my_label = "value"
      }
    }
  }
   network_interface {
    subnetwork = module.default_network.subnetwork_id

    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}

