terraform {
  backend "gcs" {
    bucket = "dos18-state-bucket-123213232wfdsfdfsdf"
    prefix = "states/lb-groups/"
  }
}
