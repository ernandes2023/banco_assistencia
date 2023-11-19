create database assistencia;
use assistencia;
create table tecnico(
id_tec int auto_increment primary key,
nome_tec varchar (55),
cargo varchar (55),
login varchar (20),
senha varchar (20)
);
create table cliente(
id_cliente int auto_increment primary key,
nome_cliente varchar (55)
);
create table produto(
id_prod int auto_increment primary key,
nome_prod varchar(55),
cliente_id int,
foreign key (cliente_id) references cliente (id_cliente)
);
create table componente(
id_comp int auto_increment primary key,
nome_comp varchar(55)
);
create table prod_comp(
id int auto_increment primary key,
prod_qtd int,
qtd int,
foreign key (prod_qtd) references componente (id_comp)
);
create table manutencao(
comp_id int,
prod_id int,
tec_id int,
cliente_id int,
defeito varchar (55),
serie int,
fabricacao int ,
data_reparo date,
garantia varchar (55),
causas varchar (55),
versao_anterior float,
versao_atual float,
primary key (comp_id, prod_id, tec_id),
foreign key(comp_id) references prod_comp (id),
foreign key(prod_id) references produto (id_prod),
foreign key(tec_id) references tecnico (id_tec),
foreign key(cliente_id) references cliente (id_cliente)
);
select  
produto . nome_prod , 
nome_cliente , 
manutencao . garantia , 
manutencao . defeito,
manutencao . causas, 
componente . nome_comp  ,
prod_comp . qtd, 
tecnico . nome_tec 
from manutencao
inner join produto on prod_id = id_prod
inner join tecnico on tec_id = id_tec
inner join componente on comp_id  = id_comp 
inner join prod_comp on comp_id = id
inner join cliente on cliente_id = id_cliente;

select * from manutencao

