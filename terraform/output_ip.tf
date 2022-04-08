output "ip_address" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}
