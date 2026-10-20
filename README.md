# 🏋️ CODE DOJO — Academia FitSenai

A academia **FitSenai** ainda controla tudo em cadernos e planilhas soltas. O proprietário deseja implementar um banco de dados e apresentará suas necessidades aos poucos, como acontece com um cliente real.

## 📌 Necessidades do sistema

### 1. Alunos e Planos

É necessário cadastrar os alunos com os seguintes dados:

- CPF;
- Nome;
- Telefone;
- Data de nascimento.

A academia possui os seguintes tipos de planos:

- Mensal;
- Trimestral;
- Anual.

Cada plano possui uma mensalidade diferenciada.

**Regras de negócio:**
- Cada aluno está vinculado a um único plano.
- Um plano pode estar vinculado a vários alunos.

### 2. Modalidades e Turmas

A academia oferece as seguintes modalidades:

- Treino funcional;
- Musculação;
- Natação;
- Pilates.

Para cada modalidade, devem ser cadastrados o nome e uma breve descrição.

Para cada turma, devem ser cadastrados:

- Dia da semana;
- Horário;
- Número de vagas.

**Regras de negócio:**
- Uma modalidade pode estar associada a várias turmas.
- Cada turma pertence a uma única modalidade.

### 3. Instrutores

Para cada instrutor, devem ser cadastrados:

- CREF;
- Nome;
- Telefone.

**Regras de negócio:**
- Cada turma é conduzida por um único instrutor.
- Um instrutor pode conduzir várias turmas.

### 4. Matrículas nas Turmas

Os alunos podem se matricular nas turmas oferecidas pela academia.

Para cada matrícula, devem ser armazenados:

- Data da matrícula;
- Situação da matrícula: ativa ou cancelada.

**Regras de negócio:**
- Um aluno pode se matricular em várias turmas.
- Uma turma pode ter vários alunos.
- O relacionamento entre alunos e turmas é do tipo **N:N (muitos para muitos)** e deve ser implementado por meio de uma tabela associativa de matrículas.

## 🗄️ Modelo Físico do Banco de Dados

### Atividades

- [ ] Editar o script `academia.sql` para criar as seis tabelas do banco de dados.
- [ ] Criar primeiro as tabelas **pai** e, em seguida, as tabelas **filhas**, respeitando as dependências das chaves estrangeiras.
- [ ] Utilizar as seguintes constraints, conforme necessário:
  - `PRIMARY KEY (PK)` — chave primária;
  - `FOREIGN KEY (FK)` — chave estrangeira;
  - `NOT NULL` — campo obrigatório;
  - `UNIQUE` — valores únicos.
- [ ] Inserir dados de teste, respeitando as seguintes quantidades mínimas:

| Entidade | Quantidade mínima |
|---|---:|
| Planos | 3 |
| Modalidades | 3 |
| Instrutores | 3 |
| Alunos | 5 |
| Turmas | 5 |
| Matrículas | 8 |

### Testes de Integridade Referencial

Realizar os seguintes testes e registrar os resultados:

- [ ] **Teste 1 — Chave estrangeira inexistente:** tentar inserir um registro que referencie um identificador inexistente em uma tabela relacionada e verificar se o banco de dados rejeita a operação.
- [ ] **Teste 2 — CPF duplicado:** tentar cadastrar dois alunos com o mesmo CPF e verificar se a constraint `UNIQUE` impede a duplicidade.

**Importante:** tirar um print da mensagem de erro de cada teste para comprovar que as restrições de integridade estão funcionando corretamente.

## 🎯 Objetivo do desafio

Construir um modelo físico de banco de dados relacional para a academia FitSenai, aplicando conceitos de modelagem de dados, relacionamentos entre tabelas, chaves primárias e estrangeiras, constraints e integridade referencial.
