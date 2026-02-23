# Nome da EC2
variable "nome_ec2" {
  type        = string
  description = "Nome da instancia"
}

# Informar qual bloco da criação da VPC
variable "meubloco_cidr" {
  type        = string
  description = "Bloco CIDR para criação da VPC"

}