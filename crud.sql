create table alunos(
	id serial primary key,
	nome varchar(255),
	idade integer,
	ativo bool
);

drop table alunos;

insert into alunos(nome, idade, ativo) values ('Dávison Nunes Mota', 23, true);
insert into alunos(nome, idade, ativo) values ('Douglas Mota', 26, false);
select id, nome as "Nome do Aluno", idade, ativo from alunos;


-- Toda vez que for alterar ou deletar um registro é recomendade fazer uma seleção antes 
-- para ter certeza que está fazendo o filtro correto
-- porque pode atualizar ou apagar tudo da tabela se não tiver com o filtro
-- ou fazer a operação nas tuplas erradas

select nome from alunos where nome = 'Douglas Mota';
-- mesmo resultado os dois updates abaixo
update alunos set nome = 'Douglas Nunes Mota' where nome = 'Douglas Mota';
update alunos set nome = 'Douglas Nunes Mota' where nome in (select nome from alunos where nome = 'Douglas Mota');

-- erro comum e grave, 
-- aqui está atualizando a coluna nome de todas as tuplas
-- tem que tomar cuidado e verificar se o filtro está correto
update alunos set nome = 'Dávison';

-- erro comum e grave, 
-- aqui está deletando todas as tuplas da tabela
-- esse erro simplemente deleta tudo
-- tem que tomar cuidado e verificar se o filtro está correto
delete from alunos;


select id, nome from alunos where id = 2;
delete from alunos where id = 2;

select id, nome as "Nome do Aluno", idade, ativo from alunos;
