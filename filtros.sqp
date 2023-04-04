create table alunos(
	id serial,
	nome varchar,
	idade integer
);
drop table alunos;
alter table alunos add constraint pk_alunos primary key (id); 

select * from alunos;
insert into alunos (nome, idade) values ('Dávison Nunes Mota', 23);
insert into alunos (nome, idade) values ('Douglas Nunes Mota', 26);
insert into alunos (nome, idade) values ('Warlyson Nunes Mota', 28);

--          FILTROS
-- igualdade
select nome from alunos where idade = 23;
select idade from alunos where nome = 'Dávison Nunes Mota';

-- diferença
select nome, idade from alunos where idade <> 23;
select nome, idade from alunos where idade != 26;

-- LIKE (parecido) usado junto com os operadores especiais _ e %
-- operador _ 
-- _ significa qualquer caracter naquela posição ('D_vison')
-- tem também o NOT LIKE
select nome from alunos where nome like 'D_vison Nunes Mota';

-- operador %
-- qualquer coisa antes ou depois
select nome from alunos where nome like 'D%'; -- Começa com D e qualquer coisa
select nome from alunos where nome like '%á%'; -- qualquer coisa 'á' qualquer coisa

-- NULL
insert into alunos (nome) values ('Wesley Cristiano');
select * from alunos where idade is NULL;

-- Is Not NULL
select * from alunos where idade is not NULL;

-- <> <= >= serve para data e hora também
select nome, idade from alunos where idade < 26;
select nome, idade from alunos where idade <= 26;

-- between  X and Y(entre), é inclusivo, serve para nada e hora também
select * from alunos where idade between 23 and 26;


-- Operadores lógicos OR e AND
select nome, idade from alunos where nome like 'D%' and idade >= 23;
select * from alunos where nome like 'Dá%' or nome like 'Wa%';

select * from alunos;








