CREATE DATABASE revisao_ddl;
USE revisao_ddl;

CREATE TABLE usuarios (
	id INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    tipo ENUM ('gerente_projeto', 'desenvolvedor', 'cliente', 'administrador') NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO usuarios (nome, email, senha, tipo) VALUES
('João Silva', 'joao.silva@email.com', 'senha123', 'gerente_projeto'),
('Maria Oliveira', 'maria.oliveira@email.com', 'senha456', 'desenvolvedor'),
('Carlos Santos', 'carlos.santos@email.com', 'senha789', 'cliente');
SELECT * FROM usuarios;

CREATE TABLE projetos (
	id INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    descricao MEDIUMTEXT NOT NULL,
    dt_inicio DATE NOT NULL,
    dt_fim DATE NOT NULL,
    orcamento DECIMAL (12,2) NOT NULL,
    status_projeto ENUM ('planejamento', 'em_andamento', 'pausado', 'concluido', 'cancelado'),
    PRIMARY KEY (id)
);

INSERT INTO projetos (nome, descricao, dt_inicio, dt_fim, orcamento, status_projeto) VALUES
('Sistema de Gestão Empresarial', 'Desenvolvimento de um sistema ERP para pequenas e médias empresas.', '2025-06-01', '2025-12-15', 250000.00, 'planejamento'),
('Aplicativo de Delivery', 'Criação de um aplicativo para pedidos e entregas de restaurantes.', '2025-04-10', '2025-09-30', 180000.00, 'em_andamento'),
('Site Institucional', 'Desenvolvimento de um site para a apresentação institucional da empresa.', '2025-02-20', '2025-04-30', 50000.00, 'concluido');
SELECT * FROM projetos;

CREATE TABLE equipes (
    id INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);
INSERT INTO equipes (nome) VALUES
('Desenvolvimento Web'),
('Gestão de Projetos'),
('Aplicativos Móveis');
SELECT * FROM equipes;

CREATE TABLE equipe_membros (
    equipe_id INT NOT NULL,
    usuario_id INT NOT NULL,
    especialidade VARCHAR(100) NOT NULL,
    PRIMARY KEY (equipe_id, usuario_id),
    FOREIGN KEY (equipe_id) REFERENCES equipes(id) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);
INSERT INTO equipe_membros (equipe_id, usuario_id, especialidade) VALUES
(1, 2, 'Desenvolvedor Front-end'),
(1, 3, 'Desenvolvedor Back-end'),
(2, 1, 'Gerente de Projetos'),
(3, 2, 'Desenvolvedor Mobile'),
(3, 3, 'UI/UX Designer');
SELECT * FROM equipe_membros;

CREATE TABLE equipe_projetos (
    equipe_id INT NOT NULL,
    projeto_id INT NOT NULL,
    PRIMARY KEY (equipe_id, projeto_id),
    FOREIGN KEY (equipe_id) REFERENCES equipes(id) ON DELETE CASCADE,
    FOREIGN KEY (projeto_id) REFERENCES projetos(id) ON DELETE CASCADE
);

INSERT INTO equipe_projetos (equipe_id, projeto_id) VALUES
(1, 3), 
(2, 1), 
(3, 2); 
SELECT * FROM equipe_projetos;

CREATE TABLE fases_projeto (
    id INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    ordem INT NOT NULL,
    dependencias INT NULL,
    projeto_id INT NOT NULL,
    status ENUM('nao_iniciada', 'em_andamento', 'concluida', 'cancelada') NOT NULL DEFAULT 'nao_iniciada',
    PRIMARY KEY (id),
    FOREIGN KEY (dependencias) REFERENCES fases_projeto(id) ON DELETE SET NULL,
    FOREIGN KEY (projeto_id) REFERENCES projetos(id) ON DELETE CASCADE
);

INSERT INTO fases_projeto (nome, descricao, ordem, projeto_id, status) VALUES
('Planejamento Inicial', 'Definição dos objetivos do projeto.', 1, 1, 'concluida'),
('Desenvolvimento', 'Criação e implementação das funcionalidades.', 2, 1, 'em_andamento'),
('Testes', 'Verificação e validação do sistema.', 3, 1, 'nao_iniciada');
SELECT * FROM fases_projeto;

CREATE TABLE tarefas (
    id INT AUTO_INCREMENT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    prioridade ENUM('baixa', 'media', 'alta', 'critica') NOT NULL DEFAULT 'media',
    status ENUM('nao_iniciada', 'em_andamento', 'pausada', 'concluida', 'cancelada') NOT NULL DEFAULT 'nao_iniciada',
    responsavel_id INT NOT NULL,
    estimativa_horas DECIMAL(5,2) NOT NULL,
    fase_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (responsavel_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (fase_id) REFERENCES fases_projeto(id) ON DELETE CASCADE
);

INSERT INTO tarefas (titulo, descricao, prioridade, status, responsavel_id, estimativa_horas, fase_id) VALUES
('Definir Requisitos', 'Levantamento e documentação dos requisitos.', 'alta', 'concluida', 1, 40.00, 1),
('Desenvolver Backend', 'Implementação da lógica e APIs.', 'critica', 'em_andamento', 2, 80.00, 2),
('Testar Funcionalidades', 'Executar testes unitários e integrados.', 'media', 'nao_iniciada', 3, 50.00, 3);
SELECT * FROM tarefas;

CREATE TABLE dependencias_tarefas (
    tarefa_id INT NOT NULL,
    depende_de INT NOT NULL,
    PRIMARY KEY (tarefa_id, depende_de),
    FOREIGN KEY (tarefa_id) REFERENCES tarefas(id) ON DELETE CASCADE,
    FOREIGN KEY (depende_de) REFERENCES tarefas(id) ON DELETE CASCADE
);

INSERT INTO dependencias_tarefas (tarefa_id, depende_de) VALUES
(2, 1),
(3, 2);
SELECT * FROM dependencias_tarefas;

CREATE TABLE registro_tempo (
    id INT AUTO_INCREMENT NOT NULL,
    usuario_id INT NOT NULL,
    tarefa_id INT NOT NULL,
    horas_trabalhadas DECIMAL(5,2) NOT NULL,
    data_registro DATE NOT NULL DEFAULT (CURRENT_DATE),
    PRIMARY KEY (id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (tarefa_id) REFERENCES tarefas(id) ON DELETE CASCADE
);

INSERT INTO registro_tempo (usuario_id, tarefa_id, horas_trabalhadas) VALUES
(1, 1, 40.00),
(2, 2, 30.00),
(3, 3, 5.00);
SELECT * FROM registro_tempo;

CREATE TABLE marcos_projeto (
    id INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    prazo DATE NOT NULL,
    projeto_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (projeto_id) REFERENCES projetos(id) ON DELETE CASCADE
);

INSERT INTO marcos_projeto (nome, descricao, prazo, projeto_id) VALUES
('Primeira Versão', 'Entrega da versão inicial do sistema.', '2025-10-01', 1),
('Versão Final', 'Lançamento oficial do sistema.', '2025-12-15', 1),
('Teste Público', 'Testes beta com usuários reais.', '2025-11-20', 1);
SELECT * FROM marcos_projeto;

CREATE TABLE relatorios_progresso (
    id INT AUTO_INCREMENT NOT NULL,
    projeto_id INT NOT NULL,
    fase_id INT NOT NULL,
    tarefa_id INT NOT NULL,
    percentual_conclusao DECIMAL(5,2) NOT NULL CHECK (percentual_conclusao BETWEEN 0 AND 100),
    data_registro DATE NOT NULL DEFAULT (CURRENT_DATE),
    PRIMARY KEY (id),
    FOREIGN KEY (projeto_id) REFERENCES projetos(id) ON DELETE CASCADE,
    FOREIGN KEY (fase_id) REFERENCES fases_projeto(id) ON DELETE CASCADE,
    FOREIGN KEY (tarefa_id) REFERENCES tarefas(id) ON DELETE CASCADE
);

INSERT INTO relatorios_progresso (projeto_id, fase_id, tarefa_id, percentual_conclusao) VALUES
(1, 1, 1, 100.00),
(1, 2, 2, 50.00),
(1, 3, 3, 0.00);
SELECT * FROM relatorios_progresso;

-- 1
# 1.1
ALTER TABLE usuarios ADD COLUMN cargo VARCHAR(100) NOT NULL;
ALTER TABLE usuarios ADD COLUMN salario_hora DECIMAL(10,2) NOT NULL;
ALTER TABLE usuarios ADD COLUMN data_contratacao DATE;
ALTER TABLE usuarios ADD COLUMN ativo BOOLEAN DEFAULT TRUE;

# 1.2
CREATE TABLE departamentos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    codigo VARCHAR(10) UNIQUE NOT NULL
);
SELECT * FROM departamentos;

INSERT INTO departamentos (nome, codigo) VALUES 
('Desenvolvimento de Software', 'DEV001'),
('Recursos Humanos', 'RH002'),
('Financeiro', 'FIN003');

ALTER TABLE usuarios ADD COLUMN departamento_id INT;
ALTER TABLE usuarios ADD CONSTRAINT fk_departamento 
FOREIGN KEY (departamento_id) REFERENCES departamentos(id);

-- 2
# 2.1
ALTER TABLE projetos ADD COLUMN orcamento_aprovado DECIMAL(10,2);
ALTER TABLE projetos ADD COLUMN gastos_reais DECIMAL(10,2) DEFAULT 0.00;
ALTER TABLE projetos ADD COLUMN moeda VARCHAR(3) DEFAULT 'BRL';
ALTER TABLE projetos ADD COLUMN centro_custo VARCHAR(50);

# 2.2
ALTER TABLE projetos ADD COLUMN aprovado_por INT;
ALTER TABLE projetos ADD COLUMN data_aprovacao DATE;
ALTER TABLE projetos ADD CONSTRAINT fk_aprovador FOREIGN KEY (aprovado_por) REFERENCES usuarios(id);

ALTER TABLE projetos MODIFY COLUMN 
statuss ENUM('rascunho', 'planejamento', 'em_andamento', 'pausado', 'concluido', 'cancelado', 'aprovado', 'rejeitado') NOT NULL;

-- 3 
# 3.1
CREATE TABLE templates_projeto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    criador_id INT NOT NULL,
    publico BOOLEAN DEFAULT FALSE,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (criador_id) REFERENCES usuarios(id)
);
SELECT * FROM templates_projeto;

INSERT INTO templates_projeto (nome, descricao, criador_id, publico) VALUES 
('Template de Desenvolvimento Web', 'Modelo padrão para projetos de sites e aplicações web.', 1, TRUE),
('Template de Gestão Empresarial', 'Estrutura para projetos voltados à administração corporativa.', 2, FALSE),
('Template de Marketing Digital', 'Modelo de campanha e estratégias digitais.', 3, TRUE);

# 3.2
ALTER TABLE projetos ADD COLUMN template_id INT;
ALTER TABLE projetos ADD COLUMN criado_automaticamente BOOLEAN DEFAULT FALSE;
ALTER TABLE projetos ADD CONSTRAINT fk_template FOREIGN KEY (template_id) REFERENCES templates_projeto(id);