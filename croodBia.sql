-- Criando um banco de dados
CREATE DATABASE loja;
USE loja;

-- Criando uma tabela de produtos
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    categoria VARCHAR(50),
    estoque INT DEFAULT 0,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DESCRIBE produtos;

INSERT INTO produtos (nome, preco, categoria, estoque) VALUES ('Smartphone Samsung Galaxy S23', 3999.90, 'Celulares', 15);
INSERT INTO produtos (nome, preco, categoria, estoque) VALUES ('Notebook Dell Inspiron 15', 4599.00, 'Informática', 10);
INSERT INTO produtos (nome, preco, categoria, estoque) VALUES ('Mouse Logitech M170 Wireless', 89.99, 'Periféricos', 50);
INSERT INTO produtos (nome, preco, categoria, estoque) VALUES ('Teclado Mecânico Redragon Kumara', 229.90, 'Periféricos', 30);
INSERT INTO produtos (nome, preco, categoria, estoque) VALUES ('Monitor LG 24" Full HD', 749.00, 'Monitores', 20);
INSERT INTO produtos (nome, preco, categoria, estoque) VALUES ('Fone de Ouvido JBL Tune 510BT', 249.90, 'Acessórios', 35);
INSERT INTO produtos (nome, preco, categoria, estoque) VALUES ('Smartwatch Xiaomi Mi Band 8', 299.00, 'Wearables', 40);
INSERT INTO produtos (nome, preco, categoria, estoque) VALUES ('HD Externo Seagate 1TB', 299.90, 'Armazenamento', 25);
INSERT INTO produtos (nome, preco, categoria, estoque) VALUES ('SSD Kingston 480GB', 279.00, 'Armazenamento', 18);
INSERT INTO produtos (nome, preco, categoria, estoque) VALUES ('Carregador Turbo USB-C 25W Samsung', 119.90, 'Acessórios', 45);
INSERT INTO produtos (nome, preco, categoria, estoque) VALUES ('Tablet Samsung Galaxy Tab A8', 1399.00, 'Tablets', 12);
INSERT INTO produtos (nome, preco, categoria, estoque) VALUES ('Webcam Logitech C920 Full HD', 379.00, 'Periféricos', 22);
INSERT INTO produtos (nome, preco, categoria, estoque) VALUES ('Impressora HP DeskJet Ink Advantage', 399.90, 'Impressoras', 14);
INSERT INTO produtos (nome, preco, categoria, estoque) VALUES ('Pen Drive Sandisk 64GB USB 3.0', 49.90, 'Armazenamento', 60);
INSERT INTO produtos (nome, preco, categoria, estoque) VALUES ('Roteador TP-Link Archer C6 AC1200', 189.90, 'Redes', 28);
INSERT INTO produtos (nome, preco, categoria, estoque) VALUES ('Placa de Vídeo NVIDIA GeForce RTX 3060', 1899.00, 'Hardware', 5);
INSERT INTO produtos (nome, preco, categoria, estoque) VALUES ('Processador AMD Ryzen 5 5600G', 899.00, 'Hardware', 8);
INSERT INTO produtos (nome, preco, categoria, estoque) VALUES ('Memória RAM Corsair Vengeance 16GB DDR4', 399.90, 'Hardware', 12);
INSERT INTO produtos (nome, preco, categoria, estoque) VALUES ('Cooler Gamer DeepCool GAMMAXX', 149.00, 'Refrigeração', 20);
INSERT INTO produtos (nome, preco, categoria, estoque) VALUES ('Fonte Corsair 650W 80 Plus Bronze', 449.90, 'Hardware', 10);


# CRUD - ações mais utilizadas em banco de dados
-- CREATE - insert
-- READ - select
-- UPDATE - atualizar/dados
-- DELETE - deletar/dados

-- Inserindo Dados (INSERT)
#INSERT INTO nome_tabela(coluna1, coluna2, coluna3)
#VALUES (valor1, valor2, valor3);
-- 01
INSERT INTO produtos (nome, preco, categoria, estoque) VALUES ("Memória DDR5", 300.00, "Hardware", 23);

-- 02 - sem as colunas
INSERT INTO produtos VALUES ("Memória DDR5", 300.00, "Hardware", 23);

-- 03 - Multiplos registros
INSERT INTO produtos (nome, preco, categoria, estoque)
VALUES  ("Memória DDR4", 300.00, "Hardware", 23),
("Memória DDR3", 300.00, "Hardware", 23),
("Memória DDR2", 300.00, "Hardware", 23);

-- 04 - sem especificar todas as colunas
INSERT INTO produtos (nome, preco) VALUES ("Processador i5", 600.00);

# READ - SELECT - consultar um dado ou um conjunto de dados
SELECT * FROM produtos; -- Listar todas as colunas da tabela produtos

-- na pagina inicial so vai ter o nome e o preço do produto
-- selecionar colunas especificas - nome, preco
SELECT nome, preco FROM produtos;

-- Selecionar com uma condição simples
SELECT * FROM produtos WHERE id = 1;
#buscar todos os produtos onde o id seja igual a 1

SELECT * FROM produtos WHERE categoria = 'Armazenamento';
SELECT nome, estoque FROM produtos WHERE categoria = 'Armazenamento';

# UPDATE - atualizar registro
UPDATE nome_tabela
SET coluna1 = valor1, coluna2 = valor2
WHERE condição;

-- 01
UPDATE produtos
SET preco = 5000
WHERE id = 1;  

-- 02 - atualizando alguns campos especificos
UPDATE produtos
SET nome = "Smartphone Samsung Galaxy S89", estoque = 2
WHERE id = 1;

-- 03 - atualizando registros - CUIDADO!!!!!
SET SQL_SAFE_UPDATEs = 0; -- Permite update sem ID
-- SET SQL_SAFE_UPDATES = 1; -- Não permite update sem ID

-- vou atualizar os produtos da categoria hardware para a categoria periferico
UPDATE produtos
SET categoria = "Periférico"
WHERE categoria = "Hardware";

SELECT * FROM produtos WHERE categoria = "Periférico";

# DELETE - Remover dados
DELETE FROM nome_tabela WHERE condição;

-- 01 Deletendo um registro específico
SELECT * FROM produtos WHERE id = 1;
DELETE FROM produtos WHERE id = 1;

-- 02 Deletando registros em uma condição
SELECT * FROM produtos;
SELECT * FROM produtos WHERE estoque < 15;
DELETE FROM produtos WHERE estoque < 15;

-- DELETE SEM WHERE
DELETE FROM produtos;

-- EXTRAS - COMANDOS úteis para o dia a dia
DESCRIBE produtos ;

-- contar registro
SELECT COUNT(*) FROM produtos;

-- ver os ultimos registros
SELECT * FROM produtos ORDER BY id DESC LIMIT 5;
-- select em produtos, ordenar por id, em ordem decrescente com limite de 5