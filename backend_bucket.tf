resource "google_storage_bucket" "backend-terraform-state" {
    name          = "dos18-states-store"
    location      = "EU"

    versioning {
        enabled = true
    }

    encryption {
      default_kms_key_name = google_kms_crypto_key.cryptokey-state-bucket.id
    }
}