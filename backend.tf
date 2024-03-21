terraform {
    backend "gcs" {
        bucket  = "dos18-states-store"
        prefix  = "terraform/states/dev"
        # kms_encryption_key = "projects/dos18-414414/locations/europe/keyRings/dos18-terraform-states-01/cryptoKeys/cryptokey-terraform-state-bucket"
    }
}