# resource "google_compute_health_check" "autohealing" {
#   name                = "autohealing-health-check"
#   check_interval_sec  = 5
#   timeout_sec         = 5
#   healthy_threshold   = 2
#   unhealthy_threshold = 10 # 50 seconds

#   http_health_check {
#     request_path = "/healthz"
#     port         = "8080"
#   }
# # }

# resource "google_compute_instance_group_manager" "appserver" {
#   name = "appserver-test"

#   base_instance_name = "appserver"
#   zone               = "us-central1"

#   version {
#     instance_template = 
#   }

#   # all_instances_config {
#   #   metadata = {
#   #     metadata_key = "metadata_value"
#   #   }
#   #   labels = {
#   #     label_key = "label_value"
#   #   }
#   # }

#   target_pools = [google_compute_target_pool.appserver.id]
#   target_size  = 2

#   named_port {
#     name = "customhttp"
#     port = 8080
#   }

#   auto_healing_policies {
#     health_check      = google_compute_health_check.autohealing.id
#     initial_delay_sec = 300
#   }
# }