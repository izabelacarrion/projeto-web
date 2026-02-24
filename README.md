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

## 🚀  Fluxo de CI/CD (GitHub Actions)
O deploy é dividido em 5 etapas automatizadas para garantir segurança e consistência:

**codevalidate (Validação)**: Checa a sintaxe do Terraform para evitar erros de escrita.

**security_scan (Segurança)**: Utiliza o tfsec para identificar brechas de segurança na infraestrutura.

**terraform_plan (Planejamento)**: Calcula as mudanças necessárias comparando o código com o estado atual na AWS.

**terraform_apply (Execução)**: Cria/atualiza os recursos (EC2, VPC, etc.) e exporta o IP da instância.

**ansible_provisioning (Configuração)**: * Abre a porta 22 (SSH) no firewall da AWS. Instala e configura o servidor web via Ansible Playbook. Fecha a porta 22 automaticamente ao finalizar (mesmo em caso de erro).

<img width="1175" height="357" alt="Captura de tela de 2026-02-24 10-47-35" src="https://github.com/user-attachments/assets/57723a4b-5da6-4d87-8760-ec5f065af2c1" />


© 2026 - Desenvolvido por Izabela Carrion para fins de estudo em Cloud & DevOps.

