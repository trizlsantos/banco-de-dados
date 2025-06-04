-- Fácil: Sistema de Controle de Tarefas Pessoais (To-Do List) --
CREATE DATABASE todoList;
USE todoList;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE, 
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE tarefas (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descricao MEDIUMTEXT NOT NULL,
    dt_limite DATE,
    statuss ENUM("pendente", "concluida") NOT NULL DEFAULT "pendente"
);

INSERT INTO usuarios (nome, email, senha) VALUES
('João Silva', 'joao@email.com', 'senha123'),
('Maria Souza', 'maria@email.com', 'senha456'),
('Carlos Pereira', 'carlos@email.com', 'senha789');

SELECT * FROM usuarios;

CREATE TABLE usuarioTarefas (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    usuario_id INT NOT NULL,
    tarefas_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (tarefas_id) REFERENCES tarefas(id)
);

ALTER TABLE tarefas ADD COLUMN prioridade ENUM("baixa", "média", "alta");
ALTER TABLE tarefas ADD COLUMN categoria ENUM("trabalho", "pessoal", "estudos");

-- Médio: Sistema de Vendas para Loja de Roupas --,
CREATE DATABASE lojaRoupas;
USE lojaRoupas;

CREATE TABLE clientes (
   id int auto_increment not null primary key,
   nome varchar(255) not null,
   email varchar(255) unique not null,
   senha varchar(255) not null
);

INSERT INTO clientes (nome, email, senha) VALUES
('João Silva', 'joao.silva@email.com', 'senha123'),
('Maria Santos', 'maria.santos@email.com', 'senha456'),
('Carlos Souza', 'carlos.souza@email.com', 'senha789'); 

CREATE TABLE produtos(
  id int auto_increment not null,
  tamanho varchar(255),
  cor varchar(255),
  categoria varchar(255),
  preco DECIMAL (10,5),
  estoque varchar(255),
  primary key (id)
);

INSERT INTO produtos (tamanho, cor, categoria, preco, estoque) VALUES
('M', 'Azul', 'Camiseta', 49.99000, '50'),
('G', 'Preto', 'Calça', 89.95000, '30'),
('P', 'Vermelho', 'Jaqueta', 149.99000, '15');

CREATE TABLE vendas (
   id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
   clientes_id INT NOT NULL,
   dt_venda DATE NOT NULL,
   forma_pagamento VARCHAR(255),
   FOREIGN KEY (clientes_id) REFERENCES clientes(id)
);

INSERT INTO vendas (clientes_id, dt_venda, forma_pagamento) 
VALUES (1, '2025-06-04', 'Cartão de Crédito');

CREATE TABLE itens (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    produtos_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_uni DECIMAL(10,5),
    FOREIGN KEY (produtos_id) REFERENCES produtos(id)
);

INSERT INTO itens (produtos_id, quantidade, preco_uni) 
VALUES (1, 10, 25.50);

CREATE TABLE estoque_historico (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    produtos_id INT NOT NULL,
    tipo_movimentacao ENUM('entrada', 'saida') NOT NULL,
    quantidade INT NOT NULL,
    data_movimentacao DATE NOT NULL,
    FOREIGN KEY (produtos_id) REFERENCES produtos(id)
);

CREATE TABLE promocoes (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    desconto DECIMAL(5,2) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL
);

CREATE TABLE promocoes_produtos (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    promocoes_id INT NOT NULL,
    produtos_id INT NOT NULL,
    FOREIGN KEY (promocoes_id) REFERENCES promocoes(id),
    FOREIGN KEY (produtos_id) REFERENCES produtos(id)
);

-- Difícil: Plataforma de Ensino Online --
CREATE DATABASE cursosOnline;
USE cursosOnline;

  CREATE TABLE usuarios (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    tipo ENUM('aluno', 'professor', 'admin') NOT NULL
);

INSERT INTO usuarios (nome, email, senha, tipo) 
VALUES 
('João Silva', 'joao@email.com', 'senha123', 'aluno'),
('Maria Souza', 'maria@email.com', 'senha456', 'professor'),
('Carlos Almeida', 'carlos@email.com', 'senha789', 'admin');
SELECT * FROM usuarios;

CREATE TABLE cursos (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    professor_id INT NOT NULL,
    FOREIGN KEY (professor_id) REFERENCES usuarios(id)
);

INSERT INTO cursos (titulo, descricao, professor_id) 
VALUES 
('Banco de Dados SQL', 'Aprenda a modelar e gerenciar bancos de dados com SQL.', 1),
('Desenvolvimento Web', 'Curso completo sobre HTML, CSS e JavaScript.', 2),
('Inteligência Artificial', 'Fundamentos e aplicações de machine learning.', 3);

SELECT * FROM cursos;

CREATE TABLE modulos (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    curso_id INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    ordem INT NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

INSERT INTO modulos (curso_id, nome, ordem) 
VALUES 
(7, 'Introdução ao SQL', 1),
(7, 'Modelagem de Banco de Dados', 2),
(8, 'HTML e CSS Básico', 1),
(8, 'JavaScript e Interatividade', 2),
(9, 'Fundamentos de Machine Learning', 1),
(9, 'Redes Neurais e Deep Learning', 2);
SELECT * FROM modulos;
CREATE TABLE aulas (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    modulo_id INT NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    video_url VARCHAR(255),
    texto TEXT,
    duracao INT NOT NULL, -- duração em minutos
    FOREIGN KEY (modulo_id) REFERENCES modulos(id)
);

INSERT INTO aulas (modulo_id, titulo, video_url, texto, duracao) 
VALUES 
(19, 'O que é SQL?', 'https://video1.com', 'Introdução ao SQL.', 30),
(19, 'Consultas SQL básicas', 'https://video2.com', 'Aprenda SELECT, WHERE, e ORDER BY.', 40),
(22, 'Criando tabelas', 'https://video3.com', 'Como definir esquemas.', 35),
(20, 'HTML básico', 'https://video4.com', 'Estrutura de um site.', 25),
(21, 'CSS e estilização', 'https://video5.com', 'Estilos e layouts.', 45);
SELECT * FROM aulas;

CREATE TABLE inscricoes (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    aluno_id INT NOT NULL,
    curso_id INT NOT NULL,
    data_inscricao DATE NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES usuarios(id),
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

INSERT INTO inscricoes (aluno_id, curso_id, data_inscricao)
VALUES 
(1, 7, '2025-06-04');

CREATE TABLE progresso (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    aluno_id INT NOT NULL,
    aula_id INT NOT NULL,
    concluido BOOLEAN NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES usuarios(id),
    FOREIGN KEY (aula_id) REFERENCES aulas(id)
);
INSERT INTO progresso (aluno_id, aula_id, concluido) 
VALUES 
(1, 11, TRUE),
(2, 12, FALSE);

SELECT * FROM progresso;

CREATE TABLE quizzes (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    aula_id INT NOT NULL,
    pergunta TEXT NOT NULL,
    FOREIGN KEY (aula_id) REFERENCES aulas(id)
);
INSERT INTO quizzes (aula_id, pergunta) 
VALUES 
(11, 'O que é SQL e para que serve?'),
(12, 'Qual comando usamos para selecionar dados de uma tabela?'),
(13, 'O que define uma estrutura HTML válida?'),
(14, 'Como aplicar estilos a um elemento HTML usando CSS?');
SELECT * FROM quizzes;

CREATE TABLE opcoes_quiz (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    quiz_id INT NOT NULL,
    alternativa TEXT NOT NULL,
    correta BOOLEAN NOT NULL,
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id)
);
INSERT INTO opcoes_quiz (quiz_id, alternativa, correta) 
VALUES 
(1, 'SQL é uma linguagem de programação usada para criar jogos', FALSE),
(1, 'SQL é uma linguagem para gerenciar bancos de dados', TRUE),
(1, 'SQL é um tipo de hardware para servidores', FALSE),
(2, 'O comando para selecionar dados é SELECT', TRUE),
(2, 'O comando para selecionar dados é DELETE', FALSE),
(2, 'O comando para selecionar dados é UPDATE', FALSE);

CREATE TABLE resultados_quiz (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    aluno_id INT NOT NULL,
    quiz_id INT NOT NULL,
    resposta_id INT NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES usuarios(id),
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id),
    FOREIGN KEY (resposta_id) REFERENCES opcoes_quiz(id)
);
INSERT INTO resultados_quiz (aluno_id, quiz_id, resposta_id) 
VALUES 
(1, 1, 2),  -- Aluno 1 respondeu corretamente a pergunta 1
(2, 1, 1),  -- Aluno 2 respondeu incorretamente a pergunta 1
(1, 2, 3),  -- Aluno 1 respondeu incorretamente a pergunta 2
(3, 2, 4);  -- Aluno 3 respondeu corretamente a pergunta 2

CREATE TABLE certificados (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    aluno_id INT NOT NULL,
    curso_id INT NOT NULL,
    data_emissao DATE NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES usuarios(id),
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

INSERT INTO certificados (aluno_id, curso_id, data_emissao) 
VALUES 
(1, 7, '2025-06-10'),
(2, 8, '2025-06-11'),
(3, 9, '2025-06-12');

CREATE TABLE comentarios (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    aluno_id INT NOT NULL,
    aula_id INT NOT NULL,
    comentario TEXT NOT NULL,
    nota INT CHECK(nota BETWEEN 1 AND 5),
    data_comentario DATE not null,
    FOREIGN KEY (aluno_id) REFERENCES usuarios(id),
    FOREIGN KEY (aula_id) REFERENCES aulas(id)
);
INSERT INTO comentarios (aluno_id, aula_id, comentario, nota, data_comentario) 
VALUES 
(1, 11, 'Ótima aula, bem explicada!', 5, '2025-06-10'),
(2, 12, 'Gostei do conteúdo, mas poderia ter mais exemplos.', 4, '2025-06-11'),
(3, 13, 'Achei um pouco rápido demais, mas aprendi bastante.', 3, '2025-06-12'),
(1, 14, 'Muito bom, me ajudou a entender melhor SQL!', 5, '2025-06-13');

SELECT * FROM comentarios;
