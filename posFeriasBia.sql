CREATE DATABASE cadastroPessoas;
USE cadastroPessoas;

CREATE TABLE usuarios (
  id_usuario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  idade INT
);

RENAME TABLE usuarios TO pessoas;
ALTER TABLE pessoas ADD COLUMN data_nascimento DATE;
ALTER TABLE pessoas MODIFY COLUMN idade int not null default 0;

CREATE TABLE enderecos (
 id_endereco int primary key auto_increment not null,
 pessoa_id int not null,
 rua varchar(255) not null,
 cidade varchar(255) not null,
 estado varchar(255) not null, 
 foreign key (pessoa_id) references pessoas(id_usuario)
);

INSERT INTO pessoas (nome, email, idade, data_nascimento)
VALUES 
  ('João Silva', 'joao@example.com', 25, '1998-05-15'),
  ('Maria Oliveira', 'maria@example.com', 23, '1999-05-20'),
  ('Carlos Lima', 'carlos.lima@example.com', 30, '1995-03-10'),
  ('Ana Souza', 'ana.souza@example.com', 28, '1997-07-22');
  
  INSERT INTO enderecos (pessoa_id, rua, cidade, estado)
VALUES 
  (1, 'Rua A, 123', 'São Paulo', 'SP'),
  (2, 'Rua C, 321', 'Maceió', 'AL'),
  (3, 'Avenida Brasil, 987', 'Recife', 'PE'),
  (4, 'Rua das Flores, 56', 'Maceió', 'AL');
  
  SELECT * FROM pessoas;
  SELECT * FROM enderecos;
  SELECT * FROM pessoas WHERE idade = 25;
  SELECT * FROM enderecos WHERE estado = 'AL';
  
  UPDATE pessoas set idade = 30  WHERE id_usuario = 1;
  UPDATE enderecos SET rua = 'Av. Atlântica, 500', cidade = 'Rio de Janeiro', estado = 'RJ' WHERE pessoa_id = 1;
  DELETE FROM pessoas WHERE id_usuario = 3;
  DELETE FROM enderecos WHERE id_endereco = 3;
  