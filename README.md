# AWS Lambda API Echo (Terraform)

Este projeto provisiona uma **API HTTP usando API Gateway v2** integrada a uma **AWS Lambda em Python**, totalmente gerenciada via **Terraform**.

O objetivo é servir como um **template simples, funcional e seguro** para criar APIs serverless na AWS, com controle de custos e boas práticas desde o início.

---

## 🧱 Arquitetura

* **AWS Lambda (Python 3.11)**
* **API Gateway v2 (HTTP API)**
* **CloudWatch Logs**
* **Terraform** como IaC (Infrastructure as Code)

Fluxo:

```
Client -> API Gateway (/health, /echo) -> Lambda -> Response
```

---

## 📁 Estrutura do Projeto

```
aws-lambda-api-echo/
│
├── lambda/
│   └── main.py               # Código da Lambda
│
├── terraform/
│   ├── api.tf                # API Gateway HTTP
│   ├── iam.tf                # Roles e policies
│   ├── lambda.tf             # Função Lambda
│   ├── lambda_permission.tf  # Permissão API → Lambda
│   ├── logs.tf               # CloudWatch Logs
│   ├── outputs.tf            # Outputs (URL da API)
│   ├── provider.tf           # Provider AWS
│   ├── routes.tf             # Rotas da API
│   ├── variables.tf          # Variáveis
│   └── terraform.tfstate*    # State (não versionar)
│
├── tests/                     # (Opcional)
├── .gitignore
└── README.md
```

---

## 🚀 Endpoints

### `GET /health`

Endpoint de verificação de saúde.

**Resposta esperada:**

```json
{
  "message": "Echo Lambda is alive"
}
```

---

### `GET /echo`

Retorna informações completas da requisição recebida (headers, path, método, etc).

Útil para:

* Debug
* Testes de integração
* Aprender o formato de eventos da API Gateway

---

## ⚙️ Pré-requisitos

* Conta AWS ativa
* AWS CLI configurada (`aws configure`)
* Terraform >= 1.5
* Python 3.11

---

## 🔐 Custos e Segurança

Este projeto foi criado com **controle de custos desde o início**:

* Uso de **HTTP API** (mais barata que REST API)
* Lambda com:

  * 128 MB de memória
  * Execução curta
* Budget configurado:

  * **Zero Spend Budget (alerta acima de $0.01)**
* Uso de **AWS Credits** (Free Tier / Promotional Credits)

> ⚠️ Mesmo com créditos, recomenda-se sempre manter budgets ativos.

---

## 🛠️ Como usar

### 1️⃣ Inicializar o Terraform

```bash
terraform init
```

---

### 2️⃣ Validar configuração

```bash
terraform validate
```

---

### 3️⃣ Planejar infraestrutura

```bash
terraform plan
```

---

### 4️⃣ Aplicar

```bash
terraform apply
```

Ao final, será exibido:

```text
api_invoke_url = https://515no9r44i.execute-api.us-east-1.amazonaws.com/
```

---

### 5️⃣ Testar

```bash
curl https://515no9r44i.execute-api.us-east-1.amazonaws.com/health
```

---

## 🧹 Destroy (opcional)

Para remover toda a infraestrutura:

```bash
terraform destroy
```

---

## 🧠 Observações Importantes

* Logs da Lambda ficam disponíveis no **CloudWatch**
* O Stage da API é `$default`
* Não é necessário deploy manual da API Gateway (HTTP API faz auto-deploy)
* O arquivo `terraform.tfstate` **não deve ser versionado**

---

---

## 📄 Licença

Este projeto é livre para uso educacional e profissional.

---

🚀 *Projeto criado como exercício prático de AWS + Terraform com foco em clareza, baixo custo e boas práticas.*
