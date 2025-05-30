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

-- Médio: Sistema de Academia
CREATE DATABASE bia_gym;
USE bia_gym;

CREATE TABLE alunos (
  id int auto_increment not null,
  nome varchar(255) not null,
  email varchar(255) not null,
  idade int not null,
  sexo varchar(255) not null,
  peso decimal(5,2) not null,
  altura decimal(5,2) not null,
  primary key (id)
);
INSERT INTO alunos (nome, email, idade, sexo, peso, altura) VALUES
('Lucas Andrade', 'lucas.andrade@example.com', 22, 'Masculino', 70.50, 1.75),
('Juliana Silva', 'juliana.silva@example.com', 19, 'Feminino', 58.20, 1.65),
('Rafael Costa', 'rafael.costa@example.com', 25, 'Masculino', 82.30, 1.80);
SELECT * FROM alunos;

CREATE TABLE exercicios (
  id int auto_increment not null,
  nome varchar(255) not null,
  gp_muscular varchar(255) not null,
  descricao mediumtext not null,
  primary key(id)
);
INSERT INTO exercicios (nome, gp_muscular, descricao) VALUES
('Supino Reto', 'Peitoral', 'Exercício para desenvolvimento do peitoral maior com barra ou halteres.'),
('Agachamento Livre', 'Quadríceps', 'Exercício composto que trabalha pernas e glúteos com barra sobre os ombros.'),
('Remada Curvada', 'Costas', 'Exercício para trabalhar o dorso com barra ou halteres, inclinando o tronco.');
SELECT * FROM exercicios;

CREATE TABLE treino (
  id int auto_increment not null,
  nome varchar(255) not null,
  dt_inicio date not null,
  personal varchar(255) not null,
  primary key (id)
);
INSERT INTO treino (nome, dt_inicio, personal) VALUES
('Treino Hipertrofia A', '2025-05-01', 'Carlos Silva'),
('Treino Funcional', '2025-05-10', 'Ana Costa'),
('Treino Emagrecimento', '2025-05-15', 'João Pereira');
SELECT * FROM treino;

CREATE TABLE TreinoExec (
  id int auto_increment not null,
  usuario_id int not null,
  treino_id int not null,
  exercio_id int not null,
  repeticoes varchar(255) not null,
  series varchar(255) not null,
  ordem mediumtext not null,
  primary key (id),
 
  foreign key (usuario_id) references alunos(id),
  foreign key (treino_id) references treino(id),
  foreign key (exercio_id) references exercicios(id)
);
INSERT INTO TreinoExec (usuario_id, treino_id, exercio_id, repeticoes, series, ordem) VALUES
(1, 1, 1, '10', '3', '1º exercício do treino A'),
(1, 1, 2, '12', '3', '2º exercício do treino A'),
(1, 1, 3, '15', '3', '3º exercício do treino A');
SELECT * FROM TreinoExec;

-- Difícil: Sistema de Entrega de Comida tipo iFood
CREATE DATABASE ifoodBibi;
USE ifoodBibi;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    tipo ENUM('cliente', 'entregador', 'restaurante') NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO usuarios (nome, email, senha, tipo) VALUES
('João Silva', 'joao.silva@email.com', 'senha123', 'cliente'),
('Maria Santos', 'maria.santos@email.com', 'seguranca456', 'entregador'),
('Pizzaria Bella', 'contato@pizzariabella.com', 'pizza789', 'restaurante');

SELECT * FROM usuarios;

CREATE TABLE restaurantes (
    id INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    CNPJ VARCHAR(18) UNIQUE NOT NULL,
    endereco TEXT NOT NULL,
    cardapio TEXT NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO restaurantes (nome, CNPJ, endereco, cardapio) VALUES
('Pizzaria Bella', '12.345.678/0001-90', 'Rua das Flores, 123 - São Paulo, SP', 'Pizza marguerita, Calabresa, Quatro queijos'),
('Hamburgueria Gourmet', '98.765.432/0001-50', 'Avenida Central, 456 - Rio de Janeiro, RJ', 'Hambúrguer artesanal, Batata frita, Milkshake'),
('Sushi Express', '56.789.012/0001-30', 'Praça da Liberdade, 789 - Belo Horizonte, MG', 'Temaki, Sashimi, Sushi de salmão');

SELECT * FROM restaurantes;

CREATE TABLE produtos (
    id INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    imagem VARCHAR(255),
    restaurante_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (restaurante_id) REFERENCES restaurantes(id)
);

INSERT INTO produtos (nome, descricao, preco, imagem, restaurante_id) VALUES
('Pizza Marguerita', 'Pizza clássica com molho de tomate, mussarela e manjericão.', 39.90, 'marguerita.jpg', 1),
('Hambúrguer Artesanal', 'Pão brioche, carne Angus, queijo cheddar e molho especial.', 29.90, 'hamburguer.jpg', 2),
('Sushi de Salmão', 'Sushi de salmão fresco com arroz temperado.', 25.50, 'sushi.jpg', 3);

SELECT * FROM produtos;

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT NOT NULL,
    cliente_id INT NOT NULL,
    restaurante_id INT NOT NULL,
    data_hora DATETIME NOT NULL,
    status ENUM('aguardando', 'preparando', 'enviado', 'entregue') NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (cliente_id) REFERENCES usuarios(id),
    FOREIGN KEY (restaurante_id) REFERENCES restaurantes(id)
);

INSERT INTO pedidos (cliente_id, restaurante_id, data_hora, status) VALUES
(1, 1, '2025-05-30 12:00:00', 'aguardando'),
(1, 2, '2025-05-30 12:15:00', 'preparando'),
(1, 3, '2025-05-30 12:30:00', 'enviado');

SELECT * FROM pedidos;

CREATE TABLE pedidos_produtos (
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (pedido_id, produto_id),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO pedidos_produtos (pedido_id, produto_id, quantidade) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 3);

SELECT * FROM pedidos_produtos;

CREATE TABLE entregadores (
    id INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    veiculo VARCHAR(255) NOT NULL,
    localizacao VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO entregadores (nome, veiculo, localizacao) VALUES
('Carlos Almeida', 'Moto Yamaha', 'São Paulo - SP'),
('Fernanda Costa', 'Bicicleta elétrica', 'Rio de Janeiro - RJ'),
('Roberto Nunes', 'Carro Hatch', 'Belo Horizonte - MG');

SELECT * FROM entregadores;

CREATE TABLE entregas (
    id INT AUTO_INCREMENT NOT NULL,
    pedido_id INT NOT NULL,
    entregador_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (entregador_id) REFERENCES entregadores(id)
);

INSERT INTO entregas (pedido_id, entregador_id) VALUES
(1, 1),
(2, 2),
(3, 3);

SELECT * FROM entregas;

CREATE TABLE avaliacoes (
    id INT AUTO_INCREMENT NOT NULL,
    pedido_id INT NOT NULL,
    cliente_id INT NOT NULL,
    nota INT NOT NULL CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (cliente_id) REFERENCES usuarios(id)
);

INSERT INTO avaliacoes (pedido_id, cliente_id, nota, comentario) VALUES
(1, 1, 5, 'A pizza estava deliciosa!'),
(2, 1, 4, 'O hambúrguer chegou um pouco frio, mas estava saboroso.'),
(3, 1, 5, 'Sushi impecável, ótima entrega.');

SELECT * FROM avaliacoes;
