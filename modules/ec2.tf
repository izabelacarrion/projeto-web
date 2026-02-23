#Procurando a AMI para uso na EC2
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# Criando instancia EC2
resource "aws_instance" "maquina_web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  # Adicionando IP privado na instancia
  private_ip = "192.168.0.50"

  # Adiciona VPC correta
  subnet_id = aws_subnet.terraform-subnet.id

  # Adiciona SG
  vpc_security_group_ids = [aws_security_group.sg_terraform.id]

  # Adiciona IP publico dinâmico
  associate_public_ip_address = true

  # Adiciona Chave SSH
  key_name = "key-homol"

  # Criando nome do volume e tamanho do volume
  root_block_device {
    volume_size = 8
  }

  tags = {
    Name       = var.nome_ec2
    Plataforma = data.aws_ami.ubuntu.platform_details
  }

  depends_on = [
    aws_vpc.terraform-vpc,
    aws_security_group.sg_terraform
  ]
}