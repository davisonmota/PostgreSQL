CREATE DATABASE alura;

CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
	primeiro_nome VARCHAR(255) NOT NULL,
	ultimo_nome VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL
);

CREATE TABLE categoria (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE curso (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES categoria(id)
);

CREATE TABLE aluno_curso (
	aluno_id INTEGER NOT NULL REFERENCES aluno(id),
	curso_id INTEGER NOT NULL REFERENCES curso(id),
	PRIMARY KEY (aluno_id, curso_id)
);

INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) VALUES 
	('Dávison', 'Mota', '1999-07-19'),
	('Douglas', 'Mota', '1997-03-12'),
	('Fulano', 'Silva', '1986-05-17'),
	('Wesley', 'Nunes', '1986-05-17');

INSERT INTO categoria (nome) VALUES 
	('Front-end'),
	('Programação'),
	('Banco de Dados'),
	('Data Science');

INSERT INTO curso (nome, categoria_id) VALUES 
	('HTML', 1),
	('CSS', 1),
	('JS', 1),
	
	('C++', 2),
	('JAVA', 2),
	('SQL', 3),
	
	('MySQL', 3),
	('Pandas', 4),
	('BI', 4);
	
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES 
	(1, 4),
	(1, 6),
	(1, 8),
	
	(2, 1),
	(2, 2),
	(2, 6),
	
	(3, 3),
	(3, 5),
	(3, 7);


select * from aluno;
select * from categoria;
select * from curso;
select * from aluno_curso;

SELECT
	aluno.primeiro_nome AS "Nome Aluno",
	aluno.data_nascimento AS "Data Nascimento",
	curso.nome AS "Nome Curso",
	categoria.nome AS "Categoria"
	FROM aluno 
	LEFT JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
	LEFT JOIN curso ON curso.id = aluno_curso.curso_id
	LEFT JOIN categoria ON curso.categoria_id = categoria.id
	ORDER BY aluno.primeiro_nome;


SELECT
	aluno.primeiro_nome AS "Aluno",
	COUNT (aluno_curso.curso_id) AS numero_cursos
	FROM aluno 
	LEFT JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
	GROUP BY aluno.primeiro_nome
	ORDER BY numero_cursos DESC, aluno.primeiro_nome ASC;


SELECT 
	curso.nome as "Curso",
	COUNT(curso.id)
	FROM curso
	JOIN aluno_curso ON aluno_curso.curso_id = curso.id
	GROUP BY curso.nome;


SELECT * FROM curso WHERE categoria_id = 1 OR categoria_id = 2;
-- usando IN, mesmo resultado do comando acima
SELECT * FROM curso WHERE categoria_id IN (1,2); -- compara com os valores da lista IN (x,y...)

-- FROM tabela, essa "tabela" no from pode ser temporária, pode ser um resultado de um select.













