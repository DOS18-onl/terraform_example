resource "google_kms_key_ring" "dos18-terraform-states" {
  name     = "dos18-terraform-states-01"
  location = "europe"
}

resource "google_kms_crypto_key" "cryptokey-state-bucket" {
  name            = "cryptokey-terraform-state-bucket"
  key_ring        = google_kms_key_ring.dos18-terraform-states.id
  rotation_period = "7776000s"
}
