output "resource_group" {
  value = "${var.resource_group}"
}

output "collector_name" {
  value = "${var.collector_name}"
}

output "compute_instance_name" {
  value = "${azurerm_virtual_machine.collector.name}"
}

output "location" {
  value = "${azurerm_virtual_machine.collector.location}"
}

output "vm_size" {
  value = "${azurerm_virtual_machine.collector.vm_size}"
}

output "compute_image" {
  value = "${var.compute_image}"
}

output "subnet_id" {
  value = "${var.subnet_id}"
}

output "disk_type" {
  value = "${var.disk_type}"
}

output "admin_password" {
  value = "${random_uuid.admin_password.result}"
}

output "public_ip_address" {
  value = "${azurerm_public_ip.collector.ip_address}"
}
