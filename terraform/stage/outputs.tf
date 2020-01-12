#output "app_external_ip" {
#  value = google_compute_instance.app[count.index].network_interface[0].access_config[0].nat_ip
#}
#output "lb_external_ip" {
#  value = google_compute_forwarding_rule.my-lb-forwarding-rule.ip_address
#}
output "app_external_ip" {
  value = module.app.app_external_ip
}
