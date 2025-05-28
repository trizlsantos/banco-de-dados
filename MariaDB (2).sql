# Att01 - ALTER TABLE

CREATE TABLE funcionarios (
    id INT PRIMARY KEY,
    nome  VARCHAR(100),
    cargo VARCHAR(50),
    salario DECIMAL(10, 2)
);


ALTER TABLE funcionarios ADD COLUMN data_admissao DATE AFTER nome;

ALTER TABLE funcionarios MODIFY COLUMN salario DECIMAL (12,2);

ALTER TABLE funcionarios RENAME COLUMN cargo to funcao;

ALTER TABLE funcionarios DROP column data_admissao;

-- adicionar uma coluna com restrição not null 
ALTER TABLE funcionarios ADD COLUMN email VARCHAR(255) NOT NULL;
INSERT INTO funcionarios (id, nome, salario, email) VALUES (1, 'teste', 1000.00, "te@te.com");

-- alterar uma coluna para aceitar valores nulos 
ALTER TABLE funcionarios MODIFY COLUMN email VARCHAR(100) NULL;
INSERT INTO funcionarios (id, nome, salario, email) VALUES (2, 'teste', 1000.00, null);

-- adicionar uma coluna com valor padrao
ALTER TABLE funcionarios ADD COLUMN ativo BOOL DEFAULT TRUE;

ALTER TABLE funcionarios RENAME TO colaboradores;

-- criar um índice em uma coluna 
ALTER TABLE colaboradores ADD INDEX idx_nome (nome);

SELECT * FROM colaboradores;


CREATE TABLE produtos (
    codigo INT PRIMARY KEY,
    descricao  VARCHAR(200),
    preco DECIMAL(10, 2)
);

ALTER TABLE produtos MODIFY COLUMN descricao TEXT;

ALTER TABLE produtos DROP column preco;
 
ALTER TABLE produtos ADD COLUMN preco INT(10.00);

ALTER TABLE produtos RENAME TO itens_estoque;