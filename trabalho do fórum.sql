-- DEFINIÇÃO DE DADOS(DDL)

-- Criação do banco de dados biblioteca 
create database biblioteca
default charset=utf8
default collate=utf8_general_ci;
use biblioteca;

-- Criação da tabela livro
create table livro(
id int(5) not null auto_increment primary key,
nome varchar(80) not null,
autor varchar(50),
idioma varchar(20),
paginas int(4)
);

-- Criação da tabela aluno
create table aluno(
id int(5) not null auto_increment primary key,
nome varchar(50) not null,
cpf varchar(11),
nascimento date
);

-- Criação da tabela empréstimo 
create table emprestimo(
id int(10) not null auto_increment primary key,
dataemprestimo date,
datadevolucao date,
idlivro int(5),
idaluno int(5)
);

-- Alterando a tabela empréstimo para a criação de um relacionamento com tabela livro
alter table emprestimo
add constraint foreign key fk_livro(idlivro)
references livro(id);

-- Alterando a tabela empréstimo para a criação de um relacionamento com tabela aluno
alter table emprestimo
add constraint foreign key fk_aluno(idaluno)
references aluno(id);



-- MANIPULAÇÃO DE DADOS(DML)

-- Insert na tabela livro
insert into livro(nome, autor, idioma, paginas)values
('Introdução à Linguagem SQL', 'Thomas Nield', 'Português', 144),
('Análise de Dados com Python e Pandas', 'Daniel Y. Chen', 'Português', 432);

-- Insert na tabela aluno
insert into aluno(nome, cpf, nascimento) values
('João Araújo', 39660670052, 19920813),
('Samuel Miranda', 88660540352, 19970422);

-- Insert na tabela empréstimo
insert into emprestimo(dataemprestimo, datadevolucao, idlivro, idaluno) values
(20200825, 20200901, 1, 1),
(20200822, 20200831, 2, 2);

-- CONSULTA COM INNER JOIN
-- Temos como resultado da consulta SQL o nome do aluno, nome do livro e a data de devolução
select aluno.nome as 'Nome do aluno', livro.nome as 'Nome do livro', datadevolucao as 'Data de devolução' from emprestimo
inner join livro on emprestimo.idlivro = livro.id
inner join aluno on emprestimo.idaluno = aluno.id; 
