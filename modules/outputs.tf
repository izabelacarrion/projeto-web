output "instance_ip_addr" {
  value       = aws_instance.maquina_web.private_ip
  description = "IP privado da instancia"
}

output "instance_public_addr" {
  value       = aws_instance.maquina_web.public_ip
  description = "IP Publico da instancia"

}

output "security_group_id" {
  value       = aws_security_group.sg_terraform.id
  description = "ID do Security Group"
}