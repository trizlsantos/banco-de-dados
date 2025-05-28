########## CONSTRAINS/RESTRIÇÕES ############
# NOT NULL -> Não permite campos nulos 
CREATE TABLE pessoas(
  nome VARCHAR(255) NOT NULL,
  idade INT
);
SELECT * FROM pessoas;
INSERT INTO pessoas (nome, idade) VALUES ("carlos", 33)
INSERT INTO pessoas (nome, idade) VALUES ("", 33) -- string vazia não considera nulo
INSERT INTO pessoas (nome, idade) VALUES (null, 33) -- ERRO
INSERT INTO pessoas (nome) VALUES ("Wilton"); -- Aceita o insert 


