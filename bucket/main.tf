resource "google_storage_bucket" "backend-terraform-state" {
    name          = var.name
    location      = "EU"

    versioning {
        enabled = true
    }

    encryption {
      default_kms_key_name = var.kms_key
      #google_kms_crypto_key.cryptokey-state-bucket.id
    }
}
