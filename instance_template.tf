data "google_compute_image" "google_container" {
  family  = "cos-arm64-stable"
  project = "cos-cloud"
}


resource "google_compute_instance_template" "instance_template" {
  # name_prefix  = "instance-template-"
  name = "sogaz867b5"
  machine_type = "e2-micro"
  region       = "global"

  // boot disk
  disk {
    source_image =  data.google_compute_image.google_container.self_link
  }
  metadata = {
    "gce-container-declaration" = <<-EOT
            spec:
              containers:
              - name: sogaz867b5
                image: rzmv/sogaz:867b570be70c9a374bfc2c406fc4497cb6fecebb
                env:
                - name: NGINX_HOST
                  value: 0.0.0.0
                stdin: false
                tty: false
              restartPolicy: OnFailure
            # This container declaration format is not public API and may change without notice. Please
            # use gcloud command-line tool or Google Cloud Console to run Containers on Google Compute Engine.
        EOT
  }

  network_interface {
    network = "default"
  }
}