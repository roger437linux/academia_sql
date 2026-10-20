```mermaid
erDiagram
    PLANO ||--o{ ALUNO : adquire
    ALUNO ||--|{ MATRICULA : realiza
    TURMA ||--|{ MATRICULA : recebe
    MODALIDADE ||--o{ TURMA : contem
    INSTRUTOR ||--o{ TURMA : atende

    PLANO {
        int id_plano PK
        varchar tipo "NOT NULL"
        decimal mensalidade "NOT NULL"
    }

    ALUNO {
        int id_aluno PK
        varchar cpf UK "NOT NULL"
        varchar nome "NOT NULL"
        varchar telefone UK "NOT NULL"
        date data_nasc "NOT NULL"
        int id_plano FK "NOT NULL"
    }

    MODALIDADE {
        int id_modalidade PK
        varchar nome "NOT NULL"
        varchar descricao "NOT NULL"
    }

    INSTRUTOR {
        int id_instrutor PK
        varchar cref UK "NOT NULL"
        varchar nome "NOT NULL"
        varchar fone UK "NOT NULL"
    }

    TURMA {
        int id_turma PK
        int id_modalidade FK "NOT NULL"
        int id_instrutor FK "NOT NULL"
        varchar dia_semana "NOT NULL"
        time horario "NOT NULL"
        int numero_vagas "NOT NULL"
    }

    MATRICULA {
        int id_matricula PK
        int id_aluno FK "NOT NULL"
        int id_turma FK "NOT NULL"
        date data "NOT NULL"
        varchar status "NOT NULL"
    }
