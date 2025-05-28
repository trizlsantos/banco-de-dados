########## CONSTRAINS/RESTRIÇÕES ############
# NOT NULL -> Não permite campos nulos 
CREATE TABLE pessoas(
  nome VARCHAR(255) NOT NULL,
  idade INT
);
DROP TABLE pessoas;
SELECT * FROM pessoas;
INSERT INTO pessoas (nome, idade) VALUES ("carlos", 33)
INSERT INTO pessoas (nome, idade) VALUES ("", 33) -- string vazia não considera nulo
INSERT INTO pessoas (nome, idade) VALUES (null, 33) -- ERRO
INSERT INTO pessoas (nome) VALUES ("Wilton"); -- Aceita o insert 

# UNIQUE -> campos únicos 
ALTER TABLE pessoas ADD COLUMN email VARCHAR(100) Unique; 
INSERT INTO pessoas (nome, idade, email) VALUES ("Bia", 17, "b@b.com")
INSERT INTO pessoas (nome, idade, email) VALUES ("Beatriz", 18, "bibi@b.com"); -- ERROR 

# PRIMARY KEY -> É um identificador único 
CREATE TABLE produtos(
  id INT NOT NULL,
  nome VARCHAR(255),
  sku VARCHAR(10),
  PRIMARY KEY (id)
);
SELECT * FROM produtos;
INSERT INTO produtos (id, nome, sku) VALUES (1, "TV", "teste");
INSERT INTO produtos (id, nome, sku) VALUES (null, "TV", "teste"); --  ERROR
INSERT INTO produtos (id, nome, sku) VALUES (1, "TV", "teste"); - ERROR 
INSERT INTO produtos (id, nome, sku) VALUES (2, "TV2", "teste");

# AUTO_INCREMENT 
CREATE TABLE frutas(
   id INT PRIMARY KEy AUTO_INCREMENT NOt NULL,
   nome VARCHAR(50)
);
SELECT * FROm frutas;
INSERT INTO frutas(nome) VALUES ("Morango");
INSERT INTO frutas(nome) VALUES ("Melancia"), ("Banana");

#DEFAULT -> define um valor padrão para coluna 
CREATE TABLE usuarios(
   id INT PRIMARY KEY AUTO_INCREMENT NOt NULL,
   statuss ENUM('ativo', 'inativo') DEFAULt 'ativo'
);
 SELECT * FROM usuarios;
 ALTER TABLe usuarios ADD COLUMn nome VARCHAR(255) AFter id;
 INSERT INTo usuarios (nome) VALUEs ("pessoa1");
 INSERT INTo usuarios (nome, statuss) VALUEs ("pessoa2", 'ativo');
 INSERT INTo usuarios (nome, statuss) VALUEs ("pessoa3", 'inativo');
 INSERT INTo usuarios (nome, statuss) VALUEs ("pessoa3", 'pendente');

# EXERCICIO 
-- Crie uma tabela contas
-- Insira as colunas id, nome, sobrenome, situacao, saldo, data_nascimento 
-- A coluna id deve ser chave primária auto incremente e not null 
-- Encontre os melhores tipos para cada coluna 
-- Adicione 3 registros 

CREATE TABLE contas (
   id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   nome VARCHAR(200) NOT NULL,
   sobrenome VARCHAR(200) NOT NULL,
   situacao ENUM('devendo', 'pagando') DEFAULT 'pagando' NOT NULL,
   saldo INT,
   data_nascimento DATE NOT NULL
);
select * from contas;
DELETE FROM contas WHERE id = 4;

INSERT INTO contas (nome, sobrenome, situacao, saldo, data_nascimento) VALUES ("Bia", "Santos", 'pagando', 500, "2007-09-10");
INSERT INTO contas (nome, sobrenome, situacao, saldo, data_nascimento) VALUES ("Érica", "Silveira", 'devendo', 0, "2007-09-04");
INSERT INTO contas (nome, sobrenome, situacao, saldo, data_nascimento) VALUES ("Clara", "Lira", 'pagando', 5, "2007-04-22");

CREATE TABLE pessoa (
   id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   nome VARCHAR(200) NOT NULL,
   idade INT
);

CREATE TABLE endereco (
   id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   rua VARCHAR(255) NOT NULL,
   numero VARCHAR(10),
   pessoa_id INT NOT NULL,
   -- Relações das tabelas  
   FOREIGN KEY (pessoa_id) REFERENCES pessoa (id) 
);
SELECT * from pessoa;
SELECT * from endereco;
INSERT Into pessoa (nome, idade) VALUES ("bia", 17);
INSERT INTO endereco (rua, numero, pessoa_id) VALUEs ("RUA 1", "44-T", 1);
INSERT INTO endereco (rua, numero, pessoa_id) VALUEs ("RUA 1", "44-T", 10; -- ERROR pessoa n existe (por causa do id estrangeiro)
DROP TABLE pessoa;