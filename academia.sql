-- Como usuário 'sa'

create database academia;
use academia;
create user dev for login dev;
alter role db_owner add member dev;

-- Como usuário 'dev'

create table instrutores(
	id_instrutor int identity(1, 1) primary key,
	nome varchar(100) not null,
	cref varchar(50) not null unique,
	fone varchar(20) not null unique
);

insert into instrutores (nome, cref, fone) values
('Mônica', '012345-G/SP', '99999-9999'),
('Cebolinha', '067890-G/RJ', '7777-7777'),
('Cascão', '054321-G/MG', '8888-8888');


create table modalidades(
	id_modalidade int identity primary key,
	nome_modalidade varchar(100) not null,
	descricao varchar(200) not null
);

insert into modalidades (nome_modalidade, descricao) values
('funcional', ' Método que exercita o corpo de forma integrada'),
('musculação', 'Treinamento de força realizado contra resistência'),
('natação', 'Esporte de baixo impacto que utiliza a resistência da água'),
('pilates', 'Movimento focado no fortalecimento do core');


create table planos(
	id_plano int identity(101, 1) primary key,
	tipo varchar(100) not null,
	mensalidade decimal(10, 2) not null
);

insert into planos (tipo, mensalidade) values
('mensal', 250),
('trimestral', 220),
('anual', 180);


create table alunos(
	id_aluno int identity(1001, 1) primary key,
	nome_aluno varchar(100) not null,
	cpf varchar(14) not null unique,
	telefone varchar(20) not null unique,
	data_nasc date null,
	id_plano int not null,
	constraint FK_ALUNOS_PLANOS foreign key (id_plano) references planos(id_plano)
);

insert into alunos (nome_aluno, cpf, telefone, data_nasc, id_plano) values
('Mickey Mouse', '746.691.892-12', '(11) 95555-0123', '2000-09-28', 101),
('Patela', '663.203.209-58', '(21) 95555-0145', '2000-09-28', 102),
('Margarida', '116.072.283-86', '(31) 95555-0167', '2000-09-28', 102),
('Madame Min', '242.441.347-94', '(11) 95555-0189', '2000-09-28', 103),
('Peninha', '917.521.758-91', '(11) 95555-0191', '2000-09-28', 103);


create table turmas(
	id_turma int identity(10001,1) primary key,
	dia_semana varchar(20) not null,
	numero_vagas int not null check (numero_vagas >= 0),
	horario time(0) not null,
	id_instrutor int not null,
	id_modalidade int not null,
	constraint FK_TURMAS_INSTRUTORES foreign key (id_instrutor) references instrutores (id_instrutor),
	constraint FK_TURMAS_MODALIDADES foreign key (id_modalidade) references modalidades (id_modalidade)
);

insert into turmas (dia_semana, numero_vagas, horario, id_instrutor, id_modalidade) values
('segunda-feira', 15, '08:00:00', 1, 4),
('terça-feira', 15, '09:00:00', 2, 3),
('sexta-feira', 15, '20:00:00', 3, 1),
('sabado', 15, '17:00:00', 1, 4),
('segunda-feira', 15, '09:00:00', 2, 2);

create table matriculas(
	id_matricula int identity(1001, 1) primary key,
	data_matricula date not null default getdate(),
	status varchar(20) not null,
	id_aluno int not null,
	id_turma int not null,
	constraint FK_MATRICULAS_ALUNOS foreign key (id_aluno) references alunos (id_aluno),
	constraint FK_MATRICULAS_TURMAS foreign key (id_turma) references turmas (id_turma)
)

insert into matriculas (status, id_aluno, id_turma) values
('ativa', 1005, 10005),
('ativa', 1001, 10004),
('ativa', 1003, 10004),
('ativa', 1002, 10001),
('cancelada', 1004, 10003),
('ativa', 1003, 10003),
('ativa', 1005, 10002),
('cancelada', 1002, 10001),
('ativa', 1001, 10004),
('ativa', 1003, 10005);


-- --------------------------------------------------------
-- Fazer dois testes de integridade refencial 
-- (FK que não existe e CPF repetido) e tirem print do erro.
-- --------------------------------------------------------

INSERT INTO alunos (nome_aluno, cpf, telefone, data_nasc, id_plano) values
('Pato Donald', '746.691.892-12', '7777-7777', '1990-05-25', 101);

