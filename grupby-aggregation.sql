-- COUNT - Retorna a quantidade de registros
-- SUM - Retorna a soma dos registros
-- MAX - Retorna o maior valor dos registros
-- MIN - Retornar o menor valor dos registros
-- AVG - Retorna a média dos registros
drop table funcionarios;

create table vendas(
	id serial primary key,
	nome varchar,
	venda integer
);


insert into vendas ( nome, venda) values ('Davison', 100);
insert into vendas ( nome, venda) values ('Davison', 57);
insert into vendas ( nome, venda) values ('Davison', 100); 
insert into vendas ( nome, venda) values ('Douglas', 23); 
insert into vendas ( nome, venda) values ('Douglas', 203); 
insert into vendas ( nome, venda) values ('Wesley', 565); 
insert into vendas ( nome, venda) values ('Wesley', 223); 

select * from vendas;

select count(*),
		MAX(venda),
		MIN(venda),
		SUM(venda),
		ROUND(AVG(venda), 2)
	from vendas;

select nome, SUM(venda), AVG(venda) from vendas group by nome;
select nome, SUM(venda), AVG(venda) as media from vendas group by nome order by AVG(venda) desc limit 2;

