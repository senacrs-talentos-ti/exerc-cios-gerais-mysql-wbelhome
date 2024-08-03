create database lojinha;

use lojinha;
create table clientes(
	id int primary key auto_increment,
    nome varchar(40) not null,
    email varchar(40) not null
);

use lojinha;

create table produtos(
	id int primary key auto_increment,
    nome varchar(40) not null,
    preco decimal(6,2)
);

use lojinha; 

create table pedidos(
	id int primary key auto_increment,
    cliente_id int,
    foreign key (cliente_id) references clientes(id),
    data_pedido date not null,
    total decimal(6,2) not null
);

use lojinha;

create table itens_pedidos(
	pedido_id int,
    foreign key (pedido_id) references pedidos(id),
    produto_id int,
    foreign key (produto_id) references produtos(id),
    quantidade int not null,
    preco decimal (6,2) not null
);

use lojinha;
insert into clientes (nome, email) values ("will", "Will@gmail.com");
insert into clientes (nome, email) values ("Arthur", "Arthur@gmail.com");
insert into clientes (nome, email) values ("Julia", "Ju@gmail.com");
insert into clientes (nome, email) values ("Dani", "Dani@gmail.com");
insert into clientes (nome, email) values ("Jão", "Jão@gmail.com");

use lojinha;
insert into produtos (nome, preco) values ("Notebook", 2500.99);
insert into produtos (nome, preco) values ("Monitor", 999.90);
insert into produtos (nome, preco) values ("S24", 3600.89);
insert into produtos (nome, preco) values ("Teclado", 350.00);
insert into produtos (nome, preco) values ("i9", 2699.99);

use lojinha;

insert into pedidos (cliente_id, data_pedido, total) values (1, 20240204, 2321.26);
insert into pedidos (cliente_id, data_pedido, total) values (2, 20240104, 5489.99);
insert into pedidos (cliente_id, data_pedido, total) values (3, 20240410, 5000);
insert into pedidos (cliente_id, data_pedido, total) values (4, 20240524, 9546.78);
insert into pedidos (cliente_id, data_pedido, total) values (1, 20240620, 9000.78);

use lojinha;

insert into itens_pedidos (pedido_id, produto_id, quantidade, preco) values (1, 1, 4, 2500.99);
insert into itens_pedidos (pedido_id, produto_id, quantidade, preco) values (2, 2, 5, 999.90);
insert into itens_pedidos (pedido_id, produto_id, quantidade, preco) values (3, 3, 9, 3600.89);
insert into itens_pedidos (pedido_id, produto_id, quantidade, preco) values (4, 4, 10, 350.00);
insert into itens_pedidos (pedido_id, produto_id, quantidade, preco) values (5, 2, 2, 393.00);


use lojinha;

update produtos set preco = 1299.90 where id = 1;
update itens_pedidos set preco = 1299.90 where pedido_id = 1;

use lojinha; 

delete from itens_pedidos where pedido_id = 2;
delete from pedidos where id = 2;
delete from clientes where id = 2;

use lojinha;

alter table clientes add column aniversario date;

 use lojinha;
 
 select pedidos.id as id_pedido, clientes.nome as nomeCliente, produtos.nome as nomeProduto
 from clientes
 inner join pedidos on clientes.id = pedidos.cliente_id
 inner join itens_pedidos on pedidos.id = itens_pedidos.pedido_id
 inner join produtos on itens_pedidos.produto_id = produtos.id;
 
 use lojinha;
 
 select clientes.nome as nomeCliente, pedidos.cliente_id 
 from clientes
 left join pedidos on pedidos.cliente_id = clientes.id; 
 
 use lojinha;
 
 select itens_pedidos.produto_id, produtos.nome AS produtoNome
 from itens_pedidos
 right join produtos on produtos.id = itens_pedidos.produto_id;
 
 use lojinha;
 
 select sum(pedidos.total) as total_pedidos,  sum(itens_pedidos.quantidade) as quantidade_itens
 from itens_pedidos
 inner join pedidos on itens_pedidos.pedido_id = pedidos.id;
 
 use lojinha;
  
  select clientes.nome, itens_pedidos.quantidade, pedidos.total
  from clientes
  inner join pedidos on clientes.id = pedidos.cliente_id
  inner join itens_pedidos on pedidos.id = itens_pedidos.pedido_id
  inner join produtos on itens_pedidos.produto_id = produtos.id
  order by itens_pedidos.quantidade desc;
  
  use lojinha;
  
  select produtos.nome, itens_pedidos.quantidade
  from pedidos
  inner join itens_pedidos on pedidos.id = itens_pedidos.pedido_id
  inner join produtos on itens_pedidos.produto_id = produtos.id
  order by itens_pedidos.quantidade desc;
  
  use lojinha; 
  
  select clientes.nome, pedidos.total
  from clientes
  inner join pedidos on clientes.id = pedidos.cliente_id
  inner join itens_pedidos on pedidos.id = itens_pedidos.pedido_id
  order by itens_pedidos.quantidade desc;

  
  use lojinha;
  
  select produtos.nome, itens_pedidos.quantidade, pedidos.total
  from pedidos
  inner join itens_pedidos on pedidos.id = itens_pedidos.pedido_id
  inner join produtos on itens_pedidos.produto_id = produtos.id
  order by pedidos.total desc;
  
  use lojinha;
  select clientes.nome, pedidos.total
  from clientes
  inner join pedidos on clientes.id = pedidos.cliente_id
  inner join itens_pedidos on pedidos.id = itens_pedidos.pedido_id
  order by itens_pedidos.quantidade desc;
  
  use lojinha; 
  
   select clientes.nome, pedidos.total
  from clientes
  inner join pedidos on clientes.id = pedidos.cliente_id
  inner join itens_pedidos on pedidos.id = itens_pedidos.pedido_id
  order by itens_pedidos.quantidade desc;
  
  use lojinha;
  
 select clientes.nome, avg(itens_pedidos.quantidade) as media
 from itens_pedidos
 inner join pedidos on itens_pedidos.pedido_id = pedidos.id
 inner join clientes on pedidos.cliente_id = clientes.id
 group by clientes.nome;
 
 use lojinha; 
  
  select clientes.nome, pedidos.total, pedidos.data_pedido
  from pedidos
  inner join clientes on clientes.id = pedidos.cliente_id;
  
  use lojinha; 

  select produtos.nome
  from produtos
  left join itens_pedidos on produtos.id = itens_pedidos.produto_id
  where itens_pedidos.produto_id is null;
  
  use lojinha;
  
  select clientes.nome as clientes_nome, count(distinct pedidos.id) as pedidos_diferentes
  from clientes
  inner join pedidos on clientes.id = pedidos.cliente_id
  group by clientes.nome
  having pedidos_diferentes > 1;
  
  use lojinha;
  
  select pedidos.data_pedido, clientes.nome
  from pedidos
  inner join clientes on pedidos.cliente_id = clientes.id 
  order by month(pedidos.data_pedido) desc
  limit 1;

use lojinha;
 select clientes.nome, avg(pedidos.total) as total
 from clientes
 inner join pedidos on clientes.id = pedidos.cliente_id
 group by clientes.nome
 order by total desc;
