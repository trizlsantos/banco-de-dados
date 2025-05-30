-- Criar um banco de dados
-- CREATE DATABASE bancodedados;
-- USE bancodedados;

-- Excluir um bando de dados
-- DROP DATABASE bancodedados;

-- CREATE TABLE teste(nome varchar(255));

-- Att01
-- **Fácil: Sistema de Biblioteca**
CREATE DATABASE cw_teca;
USE CW_TECA;

CREATE TABLE livros (
id INT AUTO_INCREMENT NOT NULL,
titulo VARCHAR(255)  NOT NULL, 
autor VARCHAR(255) NOT NULL, 
editora VARCHAR(255) NOT NULL, 
ano_publicacao DATE NOT NULL, 
ISBN VARCHAR(18) NOT NULL UNIQUE,
PRIMARY KEY (id)
);

INSERT INTO livros (titulo, autor, editora, ano_publicacao, ISBN) VALUES
('O Alquimista', 'Paulo Coelho', 'HarperCollins', '1988-04-01', '9780061122415'),
('Dom Casmurro', 'Machado de Assis', 'Editora Garnier', '1899-08-01', '9788595084742'),
('Grande Sertão: Veredas', 'João Guimarães Rosa', 'José Olympio', '1956-07-01', '9788520937026');
SELECT * FROM livros;

CREATE TABLE usuarios (
id INT AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL, 
email VARCHAR(255) UNIQUE NOT NULL,
 telefone VARCHAR(16),
 PRIMARY KEY (id)
);
INSERT INTO usuarios (nome, email, telefone) VALUES
('Ana Souza', 'ana.souza@email.com', '5591987654321'),
('Carlos Lima', 'carlos.lima@email.com', '5591934567890'),
('Mariana Oliveira', 'mariana.oliveira@email.com', '5591998765432');
SELECT * FROM usuarios;


CREATE TABLE emprestimos (
id INT AUTO_INCREMENT NOT NULL,
usuario_id INT NOT NULL, 
livro_id INT NOT NULL, 
dt_emprestimo DATE NOT NULL,
dt_devolucao DATE NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
FOREIGN KEY (livro_id) REFERENCES livros(id)
);
INSERT INTO emprestimos (usuario_id, livro_id, dt_emprestimo, dt_devolucao) VALUES
(1, 2, '2025-05-01', '2025-05-15'),
(2, 1, '2025-04-28', '2025-05-12'),
(3, 3, '2025-05-05', '2025-05-19'),
(1, 3, '2025-05-10', '2025-05-24'),
(2, 2, '2025-04-30', '2025-05-14'),
(3, 1, '2025-05-07', '2025-05-21');
SELECT * FROM emprestimos;