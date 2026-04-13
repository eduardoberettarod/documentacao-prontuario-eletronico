# 📋 Documentação - Prontuário Eletrônico

## 📖 Sobre o Projeto

Este repositório centraliza **toda a documentação do projeto integrador de Prontuário Eletrônico**, um sistema completo para gerenciamento de pacientes, prescrições e cuidados em ambientes hospitalares.

### 🏗️ Arquitetura do Projeto

O projeto é composto por **3 repositórios principais**:

1. **documentacao-prontuario-eletronico** (este repositório) - Documentação e banco de dados
2. **Backend** - API REST e lógica de negócio
3. **Frontend** - Interface web para acesso ao sistema

Este repositório é essencial para fazer o projeto rodar, pois contém o **schema e dados do banco de dados**.

---

## 🗄️ Banco de Dados

O banco de dados `bd_prontuario_eletronico` é um sistema relacional que gerencia:

### Principais Tabelas:

| Tabela | Descrição |
|--------|-----------|
| **usuarios** | Usuários do sistema com diferentes níveis de acesso (admin, docente, aluno) |
| **pacientes** | Registro de pacientes hospitalizados com dados demográficos e clínicos |
| **medicamentos** | Catálogo de medicamentos com classes terapêuticas |
| **prescricoes** | Prescrições médicas para pacientes |
| **itens_prescricao** | Detalhes de cada item de prescrição (dosagem, via, frequência) |
| **horarios_prescricao** | Horários específicos para administração de medicamentos |
| **cuidados** | Tipos de cuidados a serem realizados |
| **paciente_cuidados** | Vinculação entre pacientes e cuidados com status |
| **relatorios** | Relatórios clínicos gerados no sistema |
| **setores** | Setores hospitalares onde os pacientes estão internados |
| **status_cuidado** | Status dos cuidados (pendente, finalizado, não feito, negado) |

### Especificações:

- **Banco de Dados**: MySQL/MariaDB
- **Charset**: UTF-8 MB4
- **Engine**: InnoDB
- **Versão do Servidor**: 10.4.32-MariaDB (ou superior)

---

## 👤 Conta de Teste

Para testar o sistema, utilize as seguintes credenciais:

| Campo | Valor |
|-------|-------|
| **Email** | `teste.docente@demo.com` |
| **Senha** | `senha123` |
| **Nível de Acesso** | Docente |

> **Nota**: Esta conta de teste está disponível no banco de dados após a execução do schema de documentação.

---

## 📁 Estrutura do Repositório

```
documentacao-prontuario-eletronico/
├── database/
│   └── bd_prontuario_eletronico.sql    # Schema e dados do banco
├── documents/
│   ├── DER/                           # Diagramas de Entidade-Relacionamento
│   ├── Fluxograma/                    # Fluxogramas do sistema
│   ├── UML/                           # Diagramas UML
│   └── wireframe/                     # Wireframes da interface
├── README.md                          # Este arquivo
└── LICENSE                            # Licença do projeto
```

---

## 🚀 Como Usar

### 1. Configurar o Banco de Dados

```sql
-- Importar o arquivo de schema no seu MySQL/MariaDB
mysql -u seu_usuario -p seu_banco < database/bd_prontuario_eletronico.sql
```

### 2. Configurar os Repositórios

Após configurar o banco de dados, cloar e configurar:
- O repositório do **Backend**
- O repositório do **Frontend**

### 3. Executar o Projeto

Seguir as instruções de cada repositório (backend e frontend) para inicializar a aplicação.

---

## 📚 Documentação Adicional

Consulte os arquivos de documentação em `documents/`:

- **DER** - Estrutura completa das entidades e relacionamentos
- **Fluxograma** - Fluxos de negócio do sistema
- **UML** - Diagramas de classes e sequência
- **Wireframe** - Prototipagem da interface

---

## 📝 Licença

Este projeto está sob licença [LICENSE](LICENSE)

---

## 📞 Contato

Para dúvidas sobre a documentação ou o projeto, consulte o repositório do backend ou frontend.
