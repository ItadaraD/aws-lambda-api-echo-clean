# AWS Lambda Echo API

**Descrição**  
Este projeto demonstra a criação de uma **API Serverless** utilizando **AWS Lambda** e **API Gateway**. O objetivo do projeto é criar uma API simples para receber e retornar dados usando a arquitetura Serverless da AWS.

---

## 🚀 Funcionalidades

- **GET /health** – Endpoint para verificação de saúde da API.
- **POST /v1/echo** – Endpoint que recebe um JSON e retorna o mesmo conteúdo enviado.
- **Validação de entrada**: Verificação de presença do campo `message` e validação do formato JSON.
- **Logs**: Utilização de **CloudWatch Logs** para rastrear eventos da API e da Lambda.

---

## 🧱 Arquitetura

Este projeto utiliza a arquitetura Serverless com as seguintes tecnologias:

- **AWS Lambda** – Processamento das requisições
- **API Gateway** – Exposição dos endpoints HTTP
- **CloudWatch** – Logs e rastreamento de eventos

### Diagrama (opcional)
Você pode adicionar um diagrama aqui, para ilustrar como as requisições são processadas.

**Diagrama de arquitetura:**

```text
Cliente (curl/Postman)  
   ↓  
API Gateway (POST /v1/echo)  
   ↓  
Lambda (lambda/echo_handler.py)  
   ↓  
Resposta JSON
