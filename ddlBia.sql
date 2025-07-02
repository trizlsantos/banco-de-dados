USE employees;

# Operadores de comparação SQL
--  comparações (>,  <, >=, <=, =, '!=, <>') filtrar os dados
-- BETWEEN - seleção de intervalos
-- LIKE - Seleção por meio de padrão %C 
-- IN - Seleção entre um conjunto de valores específicos

# utilizando WHERE 
-- Filtrar todos os dados baseado em uma condição (objetiva)
SELECT * FROM employees WHERE last_name = 'Koblick'; # igual
SELECT * FROM employees WHERE last_name <> 'Koblick'; # diferente
SELECT * FROM salaries WHERE salary <= 65000; # menor igual
SELECT * FROM titles WHERE emp_no >= 11500; # maior igual

# Utilizando DISTINCT
-- Vai selecionar apenas a variação dos valores

 SELECT DISTINCT gender FROM employees;
 SELECT DISTINCT title FROM titles;
 
 # Operadores lógicos
 -- AND: Recebe duas condições, só retorna se as condições form verdades
 -- OR: Recebe duas condições, Retornar o resultar da condição verdadeira
 -- NOT: Inverter as cláusulas;
 
#AND
SELECT * FROM  salaries WHERE salary > 13000 AND from_date > '1991-12-12' ;
SELECT * FROM salaries
WHERE salary > 13000 AND from_date > '1991-12-12' AND emp_no > 11486;

#OR
SELECT * FROM titles;
SELECT * FROM titles
WHERE title = 'senior engineer' || title = 'staff' || emp_no > 12500;

#NOT
SELECT * FROM titles
WHERE NOT title = 'staff' AND NOT title='senior engineer';
SELECT * FROM titles WHERE title='staff' AND emp_no > 11486;

# ordenado resultados - ORDER BY
-- ASC: ordem ascendente
-- DESC: ordem decrescente
SELECT * FROM salaries ORDER BY emp_no DESC; -- \/
SELECT * FROM salaries ORDER BY emp_no ASC; -- /\
SELECT * FROM titles ORDER BY title DESC;

# LIMITAR os resultados de uma consulta
-- LIMIT: comando utilizado para limitar a consulta
SELECT * FROM salaries ORDER BY salary DESC LIMIT 5;
SELECT * FROM employees ORDER BY birth_date DESC LIMIT 10;
SELECT * FROM employees WHERE gender = 'F' ORDER BY hire_date DESC LIMIT 5;

#funcoes SQL
-- MIN - retorna o maior valor de uma coluna especifica;
-- MAX - retorna o maior valor de uma coluna especifica;
-- COUNT(*) - retorna o numero de valor  que combia com algum criterio ;
-- AVG(*) - retorna a media de uma coluna ;
-- SUM(*) - retorna a sima de todos od valores ;

#MIN
SELECT salary FROM salaries ORDER BY salary LIMIT 1;
SELECT MIN(salary) FROM salaries;

#MAX
SELECT salary FROM salaries ORDER BY salary LIMIT 1;
SELECT MAX(salary) FROM salaries;


#COUNT
SELECT COUNT(*) FROM salaries WHERE salary > 100000;
SELECT COUNT(*) FROM employees WHERE gender = 'F';

#AVG()
SELECT AVG(salary) FROM salaries;


#SUM
SELECT SUM(salary) FROM salaries;

# OPERADOR LIKE - %
-- Sempre utiliza em conjunto com o where
-- Filtra baseado em um padrão 
SELECT * FROM employees WHERE first_name LIKE "%ber%";
SELECT COUNT(*) FROM employess WHERE first_name LIKE "%ber%";
SELECT * FROM employees WHERE first_name LIKE "%ber%"; -- começa com ber
SELECT * FROM employees WHERE first_name LIKE "%ber"; -- termina com ber
SELECT * FROM employees WHERE first_name LIKE "ber%" AND gender = 'F';

#IN 
-- Faz uma busca por um conjunto de valores 
SELECT DISTINCT dept_no FROM dept_emp;
SELECT * FROM dept_emp WHERE dept_no IN('d004', 'd005', 'd006');
SELECT * FROM dept_emp WHERE dept_no IN('d004', 'd005', 'd006') ORDER BY dept_no DESC;
SELECT * FROM departaments WHERE dept_name IN('Development', 'Marketing');

# OPERADOR BETWEEN	
-- Vai receber uma faixa de valores
SELECT * FROM dept_emp WHERE dept_no BETWEEN 'd001' AND 'd002';
SELECT * FROM dept_emp WHERE dept_no BETWEEN 'd001' AND 'd004' ORDER BY dept_no DESC;

# ALIAS
-- Renomear as colunas e tabelas no momento da visualização 
SELECT AVG(salary) FROM salaries;
SELECT AVG(salary) AS media FROM salaries;
SELECT AVG(salary) AS 'media dos salarios' FROM salaries;
SELECT first_name AS nome, last_name AS sobrenome 
FROM employess
WHERE first_name LIKE "%ber%";


 
 
