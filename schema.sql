DROP TABLE academico.aluno, academico.categoria, academico.curso, academico.aluno_curso;
DROP SCHEMA academico;
CREATE SCHEMA academico;

CREATE TABLE academico.aluno (
	id SERIAL PRIMARY KEY,
	primeiro_nome VARCHAR(255) NOT NULL,
	ultimo_nome VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL
);

CREATE TABLE academico.categoria(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

CREATE TABLE academico.curso (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES academico.categoria(id)
);

CREATE TABLE academico.aluno_curso (
	aluno_id INTEGER NOT NULL REFERENCES academico.categoria(id),
	curso_id INTEGER NOT NULL REFERENCES academico.curso(id),
	PRIMARY KEY (aluno_id, curso_id)	
);


SELECT * FROM academico.aluno;