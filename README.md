# 🚀 Projeto de Infraestrutura como Código


Este projeto demonstra o provisionamento de uma infraestrutura básica na AWS utilizando **Terraform**. O deploy é automatizado através de um pipeline de **CI/CD no GitHub Actions**, garantindo que a infraestrutura seja validada e aplicada de forma consistente.


## 🛠️ Tecnologias Utilizadas

* **Terraform**: Ferramenta de Infraestrutura como Código (IaC) utilizada para definir e gerenciar os recursos.
* **GitHub Actions**: Automação do ciclo de vida de deploy através de jobs de Plan e Apply.
* **Nginx**: Servidor web instalado automaticamente na instância.
* **Ansible**: Playbook para configuração do Nginx garantindo que o servidor web está instalado e rodando.

---

## ⚙️ Estrutura do Projeto
```text
.
├── main.tf            # Instância EC2 e chamada dos módulos
├── variables.tf       # Definição de variáveis globais
├── outputs.tf         # Outputs da raiz (Ex: IP publico da instância)
├── modules/            
│       ├── ec2.tf    # Definição da instância EC2, AMI, tipo de máquina, endereço de IP, etc.
│       ├── outputs.tf # Outputs do IP Publico da Instância e IP privado
│       └── network.tf # Modulo de rede, criação de VPC, tabela de roteamento, internet gateway, etc.
│       └── sg.tf      # Cria Security Group e adiciona regras de HTTP/HTTPS. 
└── .github/workflows/
    └── cria_srvweb.yml  # Pipeline de automação para criar toda estrutura através do Terraform, também chama uma playbook do Ansible para configurar o Nginx.
    └── remove_srvweb.yml # Pipeline para remover todo ambiente após os testes.
└── website/
    └── index.html # Arquivo HTML com as configurações do site
    └── imagens/ # Diretório que hospeda as imagens do site, que serão armazenadas dentro da instância EC2.
```

## 🚀 Pipeline de CI/CD
O workflow no GitHub Actions foi estruturado em dois jobs principais para garantir a visibilidade do processo:

**Terraform Plan**: Valida a sintaxe do código e exibe as mudanças que serão realizadas.

**Terraform Apply**: Executa o provisionamento real dos recursos no ambiente do LocalStack.

**Check Code Quality**: Roda terraform fmt e validate para garantir que o código está bem escrito.

**Security Scan**: Utiliza o tfsec para analisar vulnerabilidades antes de qualquer simulação.

**Ansible Playbook**: Executa uma playbook com Ansible para configurar o Nginx e a página web. 