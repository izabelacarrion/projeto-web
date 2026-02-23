
#Cria um Security Group chamado "sg_terraform"
resource "aws_security_group" "sg_terraform" {
  name        = "sg_terraform"
  description = "SG criado via Terraform"
  vpc_id      = aws_vpc.terraform-vpc.id # Captura o ID da VPC usada 

  tags = {
    Name = "SG-Terraform"
  }

}

# Cria uma regra de entrada que vai ter como IPV4 o IP interno de outro state
resource "aws_vpc_security_group_ingress_rule" "libera_https" {
  security_group_id = aws_security_group.sg_terraform.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
  description       = "Acesso WEB HTTPS"
}

resource "aws_vpc_security_group_ingress_rule" "libera_http" {
  security_group_id = aws_security_group.sg_terraform.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
  description       = "Acesso WEB HTTP"
}

# Cria uma regra de saída liberando tudo
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.sg_terraform.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # Equivalente a todas as portas
}