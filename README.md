# EcoOrbit API

Plataforma de monitoramento ambiental com detecção de riscos de queimadas e desmatamento.

## Pré-requisitos

- Docker e Docker Compose

## Como rodar

### 1 — Configurar variáveis de ambiente

Crie um arquivo `.env` na raiz do projeto com as seguintes variáveis:

JWT_SECRET=  
DB_USERNAME=  
DB_PASSWORD=  
GROQ_API_KEY=  
API_FLASK=  

### 2 — Subir os serviços

```bash
docker-compose up --build
```

## Serviços

| Serviço | URL |
|---|---|
| Eureka | http://localhost:8761 |
| API Usuários | http://localhost:8080 |
| API IA | http://localhost:8082 |
| API Predict | http://localhost:8083 |
| RabbitMQ | http://localhost:15672 |

## Endpoints

### Autenticação
| Método | Endpoint | Descrição |
|---|---|---|
| POST | http://localhost:8080/auth/register | Cadastrar usuário |
| POST | http://localhost:8080/auth/login | Realizar login e obter token JWT |

### Usuários — requer JWT
| Método | Endpoint | Descrição |
|---|---|---|
| GET | http://localhost:8080/usuarios | Listar todos os usuários |
| GET | http://localhost:8080/usuarios/{id} | Buscar usuário por ID |
| PUT | http://localhost:8080/usuarios/{id} | Atualizar usuário |
| DELETE | http://localhost:8080/usuarios/{id} | Deletar usuário |

### Chat Ambiental — requer JWT
| Método | Endpoint | Descrição |
|---|---|---|
| POST | http://localhost:8082/ia/chat | Enviar pergunta sobre meio ambiente |
| GET | http://localhost:8082/ia/chat/historico | Consultar histórico de conversa |

### Análise de Satélite — requer JWT
| Método | Endpoint | Descrição |
|---|---|---|
| POST | http://localhost:8083/analyze | Analisar risco de queimada por coordenadas |

## Autenticação

Todas as rotas exceto `/auth/**` requerem o token JWT no header.

## Autores

- Vinicius Kenzo Tocuyosi — RM 559982
- João Victor Alves da Silva — RM 559726
- Lucas Gomes de Araújo Lopes — RM 559607
