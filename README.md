# 🚀 Projeto de Infraestrutura como Código


Este projeto demonstra o provisionamento de uma infraestrutura básica na AWS utilizando **Terraform**. O deploy é automatizado através de um pipeline de **CI/CD no GitHub Actions**, garantindo que a infraestrutura seja validada e aplicada de forma consistente.


## 🛠️ Tecnologias Utilizadas

* **Terraform**: Ferramenta de Infraestrutura como Código (IaC) utilizada para definir e gerenciar os recursos.
* **GitHub Actions**: Automação do ciclo de vida de deploy através de jobs de Plan e Apply.
* **Nginx**: Servidor web instalado automaticamente na instância.

---

## ⚙️ Estrutura do Projeto
```text
.
├── main.tf            # Instância EC2 e chamada dos módulos
├── variables.tf       # Definição de variáveis globais
├── outputs.tf         # Outputs da raiz (Ex: IP publico da instância)
├── modules/            
│       ├── main.tf    # Definição de VPC, Subnet e Security Group
│       ├── outputs.tf # Outputs do IP Publico da Instância e IP privado
│       └── network.tf # Modulo de rede, criação de VPC, tabela de roteamento, internet gateway, etc.
│       └── sg.tf      # Cria Security Group e adiciona regras de HTTP/HTTPS. 
└── .github/workflows/
    └── terraform.yml  # Pipeline de automação (CI/CD)
```

## 🚀 Pipeline de CI/CD
O workflow no GitHub Actions foi estruturado em dois jobs principais para garantir a visibilidade do processo:

Terraform Plan: Valida a sintaxe do código e exibe as mudanças que serão realizadas.

Terraform Apply: Executa o provisionamento real dos recursos no ambiente do LocalStack.

Check Code Quality: Roda terraform fmt e validate para garantir que o código está bem escrito.

Security Scan: Utiliza o tfsec para analisar vulnerabilidades antes de qualquer simulação.