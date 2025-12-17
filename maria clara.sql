create database db_biblioteca;

use db_biblioteca;

create table livros(
id int auto_increment primary key,
titulo varchar (100),
autor varchar (50),
ano_publicacao int
);

insert into livros (id, titulo, autor, ano_publicacao) value
(1,'Dom Casmurro','Machado de Assis', 1899),
(2,'O Alienista','Machado de Assis',1882),
(3,'Memorias Postumas de Bras Cubas','Machado de Assis',1881),
(4,'Capitaes da Areia','Jorge Amado',1937);

select * from livros;

select titulo, ano_publicacao from livros;

select * from livros where autor = 'Machado de Assis';

set sql_safe_Updates=0;

update livros 
set ano_publicacao= 1938
where titulo = 'Capitaes da Areia';

delete from livros where id = 2;
delete from livros;
drop table livros;
create table usuarios;

use usuarios;

create table usuarios(
nome varchar(20),
ID int auto_increment PRIMARY KEY,
email varchar(200),
idade int 
);

insert into usuarios (nome,id,email,idade) value
('daniel','25','carlos5000','20'),
('carlos','35','carlos50','21'),
('clara','24','clara5','23');


select * from usuarios;

select * from usuarios where nome = 'clara';

/*______________________________________________________________________________*/

create database escola;

use escola;

create table alunos(
id int auto_increment PRIMARY KEY,
nome varchar(20),
idade int,
serie varchar(100),
cidade varchar(100)
);

drop table alunos;






insert into alunos (id,nome,idade,serie) value
(25,'Daniel','25','Primeiro Ano'),
(34,'Clra','15', 'Segundo Ano'),
(36,'Bruno','65','Terceiro Ano');

select * from alunos;
/*So exibir alunos*/
select nome, idade from alunos;
/*Exebir apenas nomes e idades*/
select * from alunos where serie = 'Segundo Ano';
/*exibir serie dos alunos*/

update alunos
set idade = 10
where id=2;

set sql_safe_updates =0;

delete from alunos where id =1;
delete from alunos;
drop table alunos;

create table cursos (
id int auto_increment primary KEY,
nome varchar(50),
idade int,
cidade varchar(50),
carga_horaria varchar(50)
);


CREATE table matriculas (
id INT auto_increment primary KEY,
alunos_id INT,
cursos_id INT,
data_matriculas DATE,
foreign key (alunos_id) references alunos(id),
foreign key (cursos_id) references cursos(id)
);

INSERT INTO alunos (nome, idade, cidade)
VALUEs
('Maria Silva', 20, 'São Paulo'),
('João Santos', 22, 'Rio de Janeiro'),
('Ana Souza', 19, 'Belo Horizonte'),
('Carlos Pereira', 25, 'Curitiba');

INSERT INTO cursos (nome, carga_horaria)
VALUES
('Banco de Dados', 40),
('Lógica de Programação', 60),
('Desenvolvimento Web', 80);

insert into matriculas (alunos_id,cursos_id,data_matriculas)
value
(1,1,'2024-02-15'),
(2,2,'2024-03-10'),
(3,1,'2024-04-05'),
(4, 3, '2024-05-20');

select data_matriculas
from matriculas

select carga_horaria
from cursos

select idade
from alunos

select cidade
from cursos

select nome, idade
from alunos
where idade>20;

select nome, cidade
from alunos
where cidade = 'São Paulo';

select nome, carga_horaria
from cursos
where carga_horaria < 70;

select alunos.nome as nome_alunos, cursos.nome as cursos
from alunos,cursos,matriculas
where alunos.id = matriculas.alunos_id
and cursos.id = matriculas.cursos_id;

select nome
from cursos
where carga_horaria =40 or carga_horaria = 80;


/************************************************************************************/

create database clinicaMedica;

use clinicaMedica;

create table medico(
CRM int primary key,
nome varchar(50) not null,
email varchar(20) not null,
telefone varchar (50),
data_nasc date,
especializacao varchar(25)
check (especializacao in ('Carduologista','Nutricionista'))
);

drop table medico;

create table paciente(
id int primary key,
cpf int unique,
nome varchar(100),
endereco varchar(75),
telefone int unique,
tipo_exame varchar(25)
check (tipo_exame in ('laboratorial','clinico'))
);

create table consulta(
id_medico int not null,
id_paciente int not null,
foreign key (id_medico) references medico(CRM),
foreign key (id_paciente)references paciente(id),
data_consult date not null,
tipo_pag varchar(20) unique
);

ALTER TABLE paciente
MODIFY cpf VARCHAR(15) UNIQUE;

INSERT INTO medico
(CRM, nome, email, telefone, data_nasc, especializacao)
VALUES
('5246','Daniel','carlos@email','988254868','2000-05-12','cardiologista'),
('3549','Gabriel','daniel@email','986845288','1997-02-12','nutricionista'),
('8549','Junior','junio@mail','9868452248','1999-03-12','nutricionista');

ALTER TABLE medico
DROP CHECK medico_chk_1;

insert into paciente(id,cpf,nome,endereco,telefone,tipo_exame)
values
('12','12345489854','carlos','irineu','1856565','prostata'),
('13','12345489865','maria','irineu','1956575','mamografia'),
('14','12345489885','mariana','irineu','1956565','ultrassom');

insert into consulta(id_medico,id_paciente,data_consult,tipo_pag)
values
(3549,13,'2000-05-12','debito'),
(8549,12,'2004-11-23','dinheiro'),
(5246,14,'2005-12-01','Pix');
select * from paciente;



DELETE FROM consulta WHERE id_paciente = 12;
DELETE FROM paciente WHERE id = 12;

DELETE FROM consulta WHERE id_paciente = 14;
update paciente set telefone = 88354958 where id= 14;

DELETE FROM consulta WHERE id_paciente = 13;
update paciente set telefone = 87348115 where id= 14;

select*from consulta;
select*from medico;
select*from paciente;


/*______________________________________________________________________________________________________/*

create database sge;
use sge;

/*Criando a primeira tabela*/
create table alunos (
id_alunos int auto_increment primary key,
nome varchar(100),
data_nasc date
);

ALTER TABLE alunos
ADD COLUMN id_curso INT;


ALTER TABLE alunos
add constraint fk_alunos_curso
 foreign key (id_curso)  references Curso(id_curso);

/*Adicionar coluna na primeira tabela*/
alter table Curso
add column preco decimal (10,2);


/*Criando a segunda tabela*/
create table Curso ( 
id_curso int auto_increment primary key ,
nome_curso varchar(75), 
carga_horaria int, 
disciplinas varchar(75),
horarios datetime
); 

/*Inserindo valores*/

insert into curso (id_alunos,nome_curso,carga_horaria,disciplinhas,horarios,preco)
values
(2,'Tecnologia da Informação',1548,'matematica','2000-05-19',2000.10),
(3,'Ciencia da Computação',1888,'ciencia','2001-05-19',2002.10),
(4,'Analise de Desenvolvimento',1889,'Dados','2002-06-19',2040.10);

insert into alunos (id_curso,nome, data_nasc,email,id_alunos)
values
(2,'CARLOS DANIEL','2004-11-23','daniel@gmail'),
(3,'CARLOS DANIEL','2004-11-24','daniel@gmail1'),
(4,'CARLOS DANIEL','2004-11-25','daniel@gmail2');

select * from alunos;

select * from curso;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE curso;
SET FOREIGN_KEY_CHECKS = 1;

/*Criando uma Terceira Tabela*/
create table professor ( 
id_professor int auto_increment primary key ,
nome varchar(75), 
carga_horaria int, 
disciplinas varchar(75)
); 

insert into professor (id_professor,nome,carga_horaria,disciplinas)
values
(2,'SEFRAS',15,'Ciencia da Computação'),
(3,'DANIEL',16,'Analise de Desenvolvimento de Dados'),
(4,'ROMEU',17,'Desenvolvedor de Sistema'),
(5,'CARLOS',18,'Matematica');

select * from professor;


/*Criando uma Terceira Tabela*/

create table funcionario( 
id_funcionario int auto_increment primary key ,
nome varchar(75), 
carga_horaria int, 
funcao varchar(75)
); 


insert into funcionario (id_funcionario,nome,carga_horaria,funcao)
values
(14,'SEFRAS',155,'Professor'),
(35,'DANIEL',166,'Cozinheiro'),
(44,'ROMEU',147,'Higienização'),
(54,'CARLOS',138,'Coordenação');

SELECT * 
FROM funcionario
WHERE id_funcionario = 44;

SELECT * 
FROM funcionario
WHERE carga_horaria = 155;

