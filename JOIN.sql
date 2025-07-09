create database livraria3D;
use livraria3D;

create table autores (
id int auto_increment primary key,
nome varchar(255) not null,
nacionalidade varchar(50) not null
);

create table livros (
	id int auto_increment primary key,
    title varchar(100) not null,
    preco decimal(8,2) not null,
    autor_id int,
    
    foreign key (autor_id) references autores(id)
);

create table vendas(
	id int auto_increment primary key,
    livros_id int,
    data_venda date,
    quantidade int,
    
    foreign key (livros_id) references livros(id)
);

INSERT INTO autores (nome, nacionalidade) VALUES
('machado de assis', 'brasileira'),
('J. K Rowling', 'Britânica'),
('George Orwell', 'Britânica'),
('Autor fantasma', 'desconhecida'),
('autor sem venda', 'desconhecido');
select * from autores;
insert into livros (title, preco, autor_id) values
('O Enigma das Estrelas', 39.90, 1),
('Caminhos de Areia', 49.50, 2),
('O Último Amanhecer', 29.75, 3),
('Fragmentos do Infinito', 55.20, 4),
('Fragmentos do alem', 55.20, 9);

select * from livros;

INSERT INTO vendas (livros_id, data_venda, quantidade) VALUES
(13, '2025-07-01', 3),
(14, '2025-07-02', 1),
(15, '2025-07-03', 5),
(16, '2025-07-04', null),
(21, '2025-07-04', null );
select * from vendas;

#inner join
-- listar os livros com seus respectivos autores
select
	livros.title, autores.nome
from
	livros
inner join autores on livros.autor_id = autores.id;

-- alias
select
L.title, A.nome, A.nacionalidade
from
livros as L
inner join autores as A on L.autor_id = A.id;

# left join
-- list os livros e o total de vendas(mesmo o livro que não foram vendidos)
select
	livros.title, vendas.quantidade
from
	livros
left join vendas on livros.id = vendas.livros_id;

#inner
select
	livros.title, vendas.data_venda
from
	livros
inner join vendas on livros.id = vendas.livros_id;

#left
select
 autores.nome, livros.title
from
 autores
left join livros on autores.id = livros.autor_id;

#consultas com WHERE
-- listar os livros que não tem autor cadastrado
select 
livros.title
from livros
left join autores on livros.autor_id = livros.id
where autores.id is null;

# mostre os livros com a soma total de unidades vendidas
select
	livros.title, sum(vendas.quantidade) as total_vendido
from 
	livros
left join vendas on livros.id = vendas.livros_id
group by livros.title;

-- liste os autores com livros que ja vendidos(sem repetir o autor)
select
	autores.nome
from
	autores
join livros on autores.id = livros.autor_id
join vendas on livros.id = vendas.livros_id;

-- liste os autores que não tiveram nenhum livro vendido

select
	autores.nome
from autores 
left join livros on autores.id = livros.autor_id
left join vendas on livros.id = vendas.livros_id
group by autores.nome
having sum(vendas.quantidade) is null;

-- encontra o autor com maior total de vendas
select
autores.nome, sum(vendas.quantidade) as total_vendas
from
autores
join livros on autores.id = livros.autor_id
join vendas on livros.id = vendas.livros_id
group by autores.nome order by total_vendas desc limit 1;


