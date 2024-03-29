resource "google_compute_instance_group_manager" "appserver" {
  name = "appserver-test"

  base_instance_name = "appserver"
  zone               = "us-central1-a"

  version {
    instance_template = google_compute_instance_template.instance_template.self_link
  }

  named_port {
    name = "customhttp"
    port = 80
  }
}

resource "google_compute_autoscaler" "appserver_autoscaler" {
  name   = "appserver-autoscaler"
  zone   = "us-central1-a"
  target = google_compute_instance_group_manager.appserver.self_link

  autoscaling_policy {
    max_replicas    = 5
    min_replicas    = 1
    cooldown_period = 60
  }
}