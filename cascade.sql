-- RELACIONAMETO
-- Alunos e Disciplinas N:N
drop table alunos;
drop table disciplinas;
drop table alunos_disciplinas;

create table alunos(
	id char(3) primary key,
	nome varchar,
	idade integer
);

create table disciplinas(
	codigo char(3) primary key,
	nome varchar
);


select * from alunos;
select * from disciplinas;

-- DELETE e UPDATE CASCADE 
create table alunos_disciplinas(
	-- quando uma tupla for exluida,
	-- então exclua em cascata as tuplas que tem um campo dela como chave estrageira, 
	-- ou seja, que estão relacionadas
	-- CASCADE
	id_aluno char(3),
	--essa sintax é equivalente à sintax abaixo na linha 33  
	codigo_disciplina char(3) references disciplinas(codigo) on delete cascade on update cascade,
	primary key (id_aluno, codigo_disciplina),
	
	foreign key (id_aluno) references alunos(id) on delete cascade on update cascade 
);

insert into alunos (id, nome) values ('001', 'Dávison');
insert into alunos (id, nome) values ('002', 'Douglas');
insert into alunos (id, nome) values ('003', 'Warlyson');
insert into alunos (id, nome) values ('004', 'Wesley');

select * from alunos;

Update alunos set idade = 23 where id = '001';
Update alunos set idade = 26 where id = '002';
Update alunos set idade = 28 where id = '003';
Update alunos set idade = 30 where id = '004';

select * from disciplinas;
insert into disciplinas (codigo, nome) values ('w01', 'HTML');
insert into disciplinas (codigo, nome) values ('w02', 'CSS');
insert into disciplinas (codigo, nome) values ('w03', 'JS');
insert into disciplinas (codigo, nome) values ('e01', 'DDD');
insert into disciplinas (codigo, nome) values ('e02', 'TDD');
insert into disciplinas (codigo, nome) values ('e03', 'TS');

select * from alunos_disciplinas; 
insert into alunos_disciplinas (id_aluno, codigo_disciplina) values ('001', 'e01'); -- Dávison DDD
insert into alunos_disciplinas (id_aluno, codigo_disciplina) values ('001', 'e02'); -- Davison TDD
insert into alunos_disciplinas (id_aluno, codigo_disciplina) values ('002', 'w01'); -- Douglas HTML
insert into alunos_disciplinas (id_aluno, codigo_disciplina) values ('002', 'w02'); -- Douglas CSS
insert into alunos_disciplinas (id_aluno, codigo_disciplina) values ('003', 'w02'); -- Warlyson CSS
insert into alunos_disciplinas (id_aluno, codigo_disciplina) values ('003', 'e01'); -- Warlyson DDD
insert into alunos_disciplinas (id_aluno, codigo_disciplina) values ('003', 'w03'); -- Warlyson JS


select *
	from alunos 
	join alunos_disciplinas on alunos.id = alunos_disciplinas.id_aluno
	join disciplinas on disciplinas.codigo = alunos_disciplinas.codigo_disciplina;

delete from alunos where id='001';
delete from alunos_disciplinas where id_aluno = '003' and codigo_disciplina  = 'w03'; 

update alunos set id = '005' where id = '001'; -- error, violação da restrição da FK
update disciplinas set codigo = 'w10' where codigo = 'w01'; 
update disciplinas set codigo = 'w20' where codigo = 'w02'; 





