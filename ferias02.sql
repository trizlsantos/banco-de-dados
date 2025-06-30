create database gerenciamentoHospital;
use gerenciamentoHospital;

create table medicos (
 id int primary key auto_increment not null,
 nome varchar(255) not null,
 crm int unique not null,
 especialidade varchar(255) not null,
 telefone int not null
);

create table consultas (
 id int primary key auto_increment not null,
 id_medico int not null,
 id_paciente int not null,
 data_consulta date not null,
 hora time not null,
 foreign key (id_medico) references medicos(id),
 foreign key (id_paciente) references pacientes(id)
);

create table pacientes (
 id int primary key auto_increment not null,
 nome varchar(255) not null,
 cpf varchar(15) not null,
 data_nascimento date not null,
 endereco varchar(255)
);

show tables;

RENAME TABLE consultas TO agendamentos;
ALTER TABLE agendamentos ADD COLUMN status enum('agendada', 'realizada', 'cancelada');
ALTER TABLE pacientes MODIFY COLUMN endereco varchar(255);

insert into pacientes (nome, cpf, data_nascimento, endereco)
values 
('Beatriz', 10230355455, '2007-09-07', 'rua coronel jaime ferreira lima, antares, maceio'),
('Maria Clara', 09385812440, '2007-12-29', 'mucambo, benedito bentes'),
('Erica', 12345678900, '2007-09-04', 'vilage das flores, benedito bentes'),
('Mariana', 45678912344, '2004-05-21', 'rua dos mortos, maceió');


insert into medicos (nome, crm, especialidade, telefone) 
values
('Ricardo', 78, 'ginecologista', 829988445552),
('Bruno', 33, 'clinico', 8255455669988),
('Taciane', 40, 'ortopedista', 825566448855),
('João', 13, 'dermatologista', 823366554447);

ALTER TABLE medicos MODIFY crm VARCHAR(20);
ALTER TABLE medicos MODIFY telefone VARCHAR(15);

INSERT INTO agendamentos (id_medico, id_paciente, data_consulta, hora)
VALUES 
(1, 2, '2025-07-01', '09:00:00'),
(2, 1, '2025-07-02', '10:30:00'),
(3, 3, '2025-07-03', '14:15:00'),
(4, 4, '2025-07-04', '08:45:00');


select * from pacientes;
select * from medicos;
SELECT * FROM agendamentos WHERE status = 'agendado';

UPDATE agendamentos
SET status = 'realizada'
WHERE id = 1; 

UPDATE pacientes
SET endereco = 'Novo Endereço, Nº 1000'
WHERE id = 2;  

DELETE FROM agendamentos
WHERE id = 3;