-- RELACIONAMETO

-- Alunos e Disciplinas N:N
create table alunos(
	id char(3) primary key,
	nome varchar,
	idade integer
);

create table disciplinas(
	codigo char(3) primary key,
	nome varchar
);

-- É importante definir as restrições na modelagem conceitual e/ou lógica para
-- evitar inconsistências indesejadas e/ou atender aos requisitos do negócio

select * from alunos;
select * from disciplinas;

-- Tablela de associação, relacionando N alunos para N disciplinas
-- references é para criar a chave estrangeira
-- poderia usar outras sintaxes, exemplo abaixo
create table alunos_disciplinas(
	id_aluno char(3) references alunos(id),-- maneira mais simples de escrever
	-- foreign key (id_aluno) references alunos(id); -- teria primeiro que criar o campo para depois
	-- criar a chae estrangeira

	codigo_disciplina char(3) references disciplinas(codigo), -- maneira mais simples de escrever
	--foreign key (codigo_disciplina) references disciplinas(codigo); -- maneira mais usada para criar 
																	-- depois que a tabela já existe
	primary key (id_aluno, codigo_disciplina) -- chave primaria composta
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

insert into alunos_disciplinas (id_aluno, codigo_disciplina) values ('008', 'w03');


-- CONSULTAS COM RELACIONAMENTO

-- join, intersecção
select *
	from alunos 
	join alunos_disciplinas on alunos_disciplinas.id_aluno = alunos.id
	join disciplinas on disciplinas.codigo = alunos_disciplinas.codigo_disciplina;
					 

-- left join, tem o dado na tabela da esquerda, mas não tem na da direita,
-- levando em consideração o critério de junção
-- traga todos os alunos, mesmo os que não estão matriculados em nenhuma disciplina, e suas matriculas
select *  
	from alunos 
	left join alunos_disciplinas on alunos_disciplinas.id_aluno = alunos.id
	left join disciplinas on disciplinas.codigo = alunos_disciplinas.codigo_disciplina;
	
select * from alunos left join alunos_disciplinas on alunos.id = alunos_disciplinas.id_aluno;

-- right join, tem o dado na tabela da direita, mas não tem na da esquerda,
-- levando em consideração o critério de junção
-- traga todas as diciplinas, mesmo as que não tem alunos matriculados, e seus alunos 
select * 
	from alunos 
	right join alunos_disciplinas on alunos_disciplinas.id_aluno = alunos.id
	right join disciplinas on disciplinas.codigo = alunos_disciplinas.codigo_disciplina;
	
-- traga os alunos e suas matriculas
select * from alunos right join alunos_disciplinas on alunos.id = alunos_disciplinas.id_aluno;

-- full join, todos os dados da tabelas
-- levando em consideração o critério de junção
-- traga todas as diciplinas, mesmo as que não tem alunos matriculados, e seus alunos,
-- E traga todos os alunos, mesmo os que não estão matriculados em nenhuma disciplina, e suas matriculas
select *  
	from alunos 
	full join alunos_disciplinas on alunos_disciplinas.id_aluno = alunos.id
	full join disciplinas on disciplinas.codigo = alunos_disciplinas.codigo_disciplina;
	
-- traga os alunos e suas matriculas
select * from alunos right join alunos_disciplinas on alunos.id = alunos_disciplinas.id_aluno;



-- cross join, produto entre as tuplas das tabelas, usar em casos bem específicos
select * from alunos cross join disciplinas;











