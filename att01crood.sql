-- Att01 CRUD
CREATE DATABASE att01Crud;
USE att01Crud;

CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(14) UNIQUE NOT NULL,
    rg VARCHAR(20) UNIQUE,
    data_nascimento DATE NOT NULL,
    sexo ENUM('masculino', 'feminino', 'outro') NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    salario DECIMAL(12, 2) NOT NULL DEFAULT 1200.00,
    data_admissao timestamp NOT NULL DEFAULT current_timestamp,
    data_demissao date NULL DEFAULT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT chk_salario_minimo CHECK (salario >= 1200.00)
);

INSERT INTO funcionarios (nome, cpf, rg, data_nascimento, sexo, cargo, salario, data_admissao) VALUES
('Ana Paula Silva', '111.222.333-44', 'SP112233445', '1988-07-21', 'feminino', 'Analista de RH', 4200.00, '2020-01-15'),
('Carlos Eduardo Oliveira', '222.333.444-55', 'RJ223344556', '1985-03-10', 'masculino', 'Gerente de TI', 8500.00, '2018-11-05'),
('Mariana Costa Souza', '333.444.555-66', 'MG334455667', '1992-12-01', 'feminino', 'Desenvolvedora Frontend', 5500.00, '2021-08-20'),
('João Pedro Almeida', '444.555.666-77', 'SP445566778', '1995-09-14', 'masculino', 'Estagiário', 1800.00, '2023-02-10'),
('Fernanda Lima Santos', '555.666.777-88', 'BA556677889', '1990-04-30', 'feminino', 'Analista de Dados', 6000.00, '2019-07-12'),
('Lucas Ferreira Nunes', '666.777.888-99', 'PR667788990', '1987-10-25', 'masculino', 'Arquiteto de Software', 9500.00, '2017-05-03'),
('Juliana Mendes Pereira', '777.888.999-00', 'RJ778899001', '1983-01-18', 'feminino', 'Coordenadora de Marketing', 7200.00, '2016-10-22'),
('Rafael Augusto Barbosa', '888.999.000-11', 'RS889900112', '1993-06-09', 'masculino', 'Suporte Técnico', 2500.00, '2022-04-01'),
('Larissa Aparecida Ribeiro', '999.000.111-22', 'GO990011223', '1996-11-17', 'feminino', 'Assistente Administrativo', 2200.00, '2023-01-05'),
('Thiago Henrique Nascimento', '101.112.223-33', 'DF101112234', '1989-08-04', 'masculino', 'DBA', 6800.00, '2020-09-14'),
('Beatriz Fernandes Machado', '112.223.334.44', 'ES112233445', '1991-02-28', 'feminino', 'Designer Gráfico', 3500.00, '2021-06-10'),
('Gustavo Reis Albuquerque', '123.334.445.55', 'PE123344556', '1986-05-19', 'masculino', 'Consultor de TI', 7000.00, '2019-03-08'),
('Isabela Rocha Martins', '134.445.566.77', 'CE134455667', '1994-10-13', 'feminino', 'Especialista de Recursos Humanos', 5000.00, '2022-11-15'),
('Daniel Ortega Lopes', '145.556.677.88', 'AM145566778', '1984-12-07', 'masculino', 'Engenheiro de Software', 8000.00, '2018-02-20'),
('Camila Cristina Alencar', '156.667.788.99', 'PA156677889', '1997-09-02', 'feminino', 'Trainee', 1500.00, '2023-09-01'),
('Felipe Augusto Cunha', '167.778.899.00', 'SC167788990', '1982-04-23', 'masculino', 'Diretor de Tecnologia', 12000.00, '2015-07-10'),
('Aline Azevedo Duarte', '178.889.900.11', 'PI178899001', '1999-03-11', 'feminino', 'Assistente de RH', 2100.00, '2023-05-20'),
('Marcelo Dias Gonçalves', '189.900.111.22', 'TO189900112', '1980-06-30', 'masculino', 'Técnico em Informática', 2300.00, '2022-12-01'),
('Vanessa Souza Melo', '190.011.222.33', 'MA190011223', '1998-01-09', 'feminino', 'Marketing Digital', 3000.00, '2021-10-18'),
('Ricardo Teixeira Freitas', '201.122.333.44', 'AC201122334', '1981-11-16', 'masculino', 'Auditor Interno', 6000.00, '2017-09-05');

-- CREATE (Inserção de Dados)
INSERT INTO funcionarios (nome, cpf, rg, data_nascimento, sexo, cargo, salario, data_admissao) VALUES 
('Beatriz', '102.303.554-55', 'AL123456789', '2007-09-10', 'feminino', 'tiktoker', 5000.00, '2025-06-06');
INSERT INTO funcionarios (nome, cpf, data_nascimento, sexo, cargo, salario, data_admissao) 
VALUES ('Èrica', '123.456.789-00', '2007-09-04', 'feminino', 'Publicitária', 1200.00, '2025-08-05');
INSERT INTO funcionarios (nome, cpf, data_nascimento, sexo, cargo, salario, data_admissao) 
VALUES ('Clara', '123.556.789-00', '2007-12-29', 'feminino', 'Faxineira', 1200.00, '2025-08-05');
INSERT INTO funcionarios (nome, cpf, rg, data_nascimento, sexo, cargo, salario, data_admissao) VALUES 
('Samuel', '100.303.555-55', 'AL123886789', '2007-02-23', 'outro', 'anlista', 3000.00, '2025-03-06');
INSERT INTO funcionarios (nome, cpf, rg, data_nascimento, sexo, cargo, salario, data_admissao) VALUES 
('Bruno', '000-222-333-55', 'AL456789123', '2007-10-30', 'feminino', 'entregador de café', 1200.00, '2025-04-03');

-- READ (Consulta de Dados)
SELECT nome, cargo, salario FROM funcionarios;
SELECT * FROM funcionarios WHERE ativo = true;
SELECT * FROM funcionarios WHERE salario > 5000.00;
SELECT * FROM funcionarios WHERE cpf =  '111.222.333-44';
SELECT COUNT(ativo) FROM funcionarios;

--  UPDATE (Atualização de Dados)
UPDATE funcionarios
SET salario = 6000.00
WHERE id_funcionario = 5;

UPDATE funcionarios
SET cargo = 'Coordenador de TI'
WHERE cpf = '222.333.444-55';

UPDATE funcionarios
SET ativo = FALSE
WHERE id_funcionario = 10;

UPDATE funcionarios
SET data_demissao = '2025-06-01'
WHERE id_funcionario = 3;

UPDATE funcionarios
SET rg = 'RS889900113' 
WHERE nome = 'Rafael Augusto Barbosa';

--  DELETE (Exclusão de Dados)
DELETE FROM funcionarios WHERE id_funcionario = 15;
DELETE FROM funcionarios WHERE cargo = "Trainee";
DELETE FROM funcionarios WHERE cpf = '190.011.222.33';
DELETE FROM funcionarios WHERE salario < 2000.00;



