output "webserver_instance_ip_addr" {
  value       = module.webserver.instance_ip_addr
  description = "IP privado da instância"
}

output "webserver_instance_public_addr" {
  value       = module.webserver.instance_public_addr
  description = "IP Publico da instância"
}