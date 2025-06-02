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

