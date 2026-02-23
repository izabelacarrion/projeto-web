output "projeto_tcc_terraform_instance_ip_addr" {
  value       = module.projeto_tcc_terraform.instance_ip_addr
  description = "IP privado da instância"
}

output "projeto_tcc_terraform_instance_public_addr" {
  value       = module.projeto_tcc_terraform.instance_public_addr
  description = "IP Publico da instância"
}