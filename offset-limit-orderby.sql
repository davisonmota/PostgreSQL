create table funcionarios (
	matricula serial primary key,
	nome varchar, 
	sobrenome varchar
);

insert into funcionarios (nome, sobrenome) values ('Dávison', 'Mota');
insert into funcionarios (nome, sobrenome) values ('Wesley', 'Cristiano');
insert into funcionarios (nome, sobrenome) values ('Douglas', 'Nunes');
insert into funcionarios (nome, sobrenome) values ('Dávison', 'Nunes');
insert into funcionarios (nome, sobrenome) values ('Marcelo', 'Guadalupe');

select * from funcionarios 
	order by nome desc; 
	
select * from funcionarios 
	order by nome asc; 
	
	
select * from funcionarios
	offset 3; -- pula x primeiras tuplas
	
	
	

	
	
	
	
	
	
	
	
	
	