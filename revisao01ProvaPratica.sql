 CREATE DATABASE IF NOT EXISTS EscolaDB;
 USE EscolaDB; 
 
 -- TABELA ALUNOS 
 CREATE TABLE Alunos ( 
 id INT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(100), 
 idade INT,
 cidade VARCHAR(100),
 nota_final DECIMAL(4,2),
 curso VARCHAR(50)
 );
 
 -- INSERÇÃO DE DADOS 
 INSERT INTO Alunos (nome, idade, cidade, nota_final, curso) 
 VALUES ('Ana Paula', 17, 'São Paulo', 8.5, 'Matemática'),
 ('Bruno Lima', 18, 'Rio de Janeiro', 6.8, 'História'), 
 ('Carlos Mendes', 17, 'São Paulo', 9.2, 'Física'),
 ('Daniela Costa', 19, 'Belo Horizonte', 7.4, 'Matemática'), 
 ('Eduardo Silva', 18, 'Curitiba', 8.1, 'Química'),
 ('Fernanda Rocha', 20, 'Salvador', 9.5, 'Física'),
 ('Gabriel Nunes', 18, 'São Paulo', 5.9, 'História'),
 ('Helena Souza', 17, 'Maceió', 7.8, 'Química'),
 ('Igor Dias', 19, 'São Paulo', 6.2, 'Matemática'), 
 ('Juliana Martins', 18, 'Rio de Janeiro', 8.7, 'Física'), 
 ('Kleber Teixeira', 20, 'Porto Alegre', 9.0, 'História'),
 ('Larissa Almeida', 17, 'Salvador', 6.3, 'Matemática'),
 ('Marcos Vinicius', 21, 'Recife', 7.2, 'Química'),
 ('Natália Lima', 20, 'Curitiba', 8.4, 'Física'),
 ('Otávio Borges', 22, 'Manaus', 5.4, 'História'), 
 ('Patrícia Rios', 18, 'São Paulo', 9.8, 'Química'), 
 ('Rafael Santos', 19, 'São Paulo', 6.5, 'Matemática'), 
 ('Sabrina Torres', 21, 'Recife', 7.1, 'História'),
 ('Thiago Monteiro', 17, 'Fortaleza', 7.9, 'Matemática'),
 ('Vanessa Freitas', 22, 'Belo Horizonte', 9.3, 'Física');
 
-- Alunos com nota_final maior que 8.0
SELECT * FROM Alunos WHERE nota_final > 8;

-- Alunos com idade menor ou igual a 18 anos
SELECT * FROM Alunos WHERE idade <= 18;

-- Alunos do curso de Matemática com nota maior que 7
SELECT * FROM Alunos WHERE curso = 'Matemática' AND nota_final > 7;

-- Alunos com nota entre 6 e 8
SELECT * FROM Alunos WHERE nota_final BETWEEN 6 AND 8;

-- Alunos que não são de São Paulo
SELECT * FROM Alunos WHERE cidade != 'São Paulo';

-- Alunos com idade entre 18 e 20 anos
SELECT * FROM Alunos WHERE idade BETWEEN 18 AND 20;

-- Alunos com idade maior que 18 e nota maior que 7
SELECT * FROM Alunos WHERE idade > 18 AND nota_final > 7;

-- Alunos que fazem Física ou Matemática
SELECT * FROM Alunos WHERE curso IN ('Física', 'Matemática');

-- Alunos com nota diferente de 7.4
SELECT * FROM Alunos WHERE nota_final != 7.4;

-- Cidades distintas
SELECT DISTINCT cidade FROM Alunos;

-- Cursos distintos
SELECT DISTINCT curso FROM Alunos;

-- Alunos com nome que começa com "A"
SELECT * FROM Alunos WHERE nome LIKE 'A%';

-- Alunos com nome que termina com "a"
SELECT * FROM Alunos WHERE nome LIKE '%a';

-- Alunos com nome contendo "ia"
SELECT * FROM Alunos WHERE nome LIKE '%ia%';

-- Alunos nas cidades de São Paulo, Salvador ou Recife
SELECT * FROM Alunos WHERE cidade IN ('São Paulo', 'Salvador', 'Recife');

-- Alunos que não estão em Curitiba ou Fortaleza
SELECT * FROM Alunos WHERE cidade NOT IN ('Curitiba', 'Fortaleza');

-- Alunos com idade entre 19 e 21 anos
SELECT * FROM Alunos WHERE idade BETWEEN 19 AND 21;

-- Alunos com nomes que não contêm a letra "o"
SELECT * FROM Alunos WHERE nome NOT LIKE '%o%';

-- Alunos com nome composto (com espaço)
SELECT * FROM Alunos WHERE nome LIKE '% %';

-- Todos os alunos ordenados por nota final decrescente
SELECT * FROM Alunos ORDER BY nota_final DESC;

-- 5 alunos com maiores notas
SELECT * FROM Alunos ORDER BY nota_final DESC LIMIT 5;

-- 3 alunos mais novos
SELECT * FROM Alunos ORDER BY idade ASC LIMIT 3;

-- Alunos ordenados por cidade e nome
SELECT * FROM Alunos ORDER BY cidade ASC, nome ASC;

-- Alunos de Química, ordenados por nota crescente
SELECT * FROM Alunos WHERE curso = 'Química' ORDER BY nota_final ASC;

-- Maior nota final registrada
SELECT MAX(nota_final) FROM Alunos;

-- Menor nota final registrada
SELECT MIN(nota_final) FROM Alunos;

-- Média das notas finais
SELECT AVG(nota_final) FROM Alunos;

-- Total de alunos
SELECT COUNT(*) AS total_alunos FROM Alunos;

-- Total de alunos por curso
SELECT curso, COUNT(*) AS total_alunos FROM Alunos GROUP BY curso;

-- Média das notas por curso, da maior para a menor
SELECT curso, AVG(nota_final) AS media_notas FROM Alunos GROUP BY curso ORDER BY media_notas DESC;

-- Total de alunos por cidade
SELECT cidade, COUNT(*) AS total_alunos FROM Alunos GROUP BY cidade;

-- Total de alunos por idade, ordenado por idade
SELECT idade, COUNT(*) AS total_alunos
FROM Alunos
GROUP BY idade
ORDER BY idade ASC;

-- Soma total das notas de todos os alunos
SELECT SUM(nota_final) AS soma_notas
FROM Alunos;

--  Quantidade de alunos com nota maior que 8
SELECT COUNT(*) AS total_acima_8
FROM Alunos
WHERE nota_final > 8;

-- 1. Alunos com nota acima de 7, com alias
SELECT nome AS Nome, nota_final AS Nota, curso AS Curso
FROM Alunos
WHERE nota_final > 7;

-- 2. Alunos com idade entre 18 e 20 e nota abaixo de 8, ordenados por nome
SELECT *
FROM Alunos
WHERE idade BETWEEN 18 AND 20 AND nota_final < 8
ORDER BY nome ASC;

-- 3. Alunos de Física ou Química com nota acima da média geral
SELECT *
FROM Alunos
WHERE curso IN ('Física', 'Química')
  AND nota_final > (SELECT AVG(nota_final) FROM Alunos);

-- 4. Curso com a maior média de notas
SELECT curso
FROM Alunos
GROUP BY curso
ORDER BY AVG(nota_final) DESC
LIMIT 1;

-- 5. Número de alunos com nota acima da média do curso de Matemática
SELECT COUNT(*) AS total_acima_da_media_matematica
FROM Alunos
WHERE curso = 'Matemática'
  AND nota_final > (
    SELECT AVG(nota_final)
    FROM Alunos
    WHERE curso = 'Matemática'
  );

 










 
  
  
