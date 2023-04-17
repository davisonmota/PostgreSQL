CREATE TEMPORARY TABLE cursos_programacao (
	id INTEGER PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

SELECT * FROM cursos_programacao;

-- inserir em uma tabela o resultado da selecao,
-- os campos do select tem que estar na ordem da definicao da tabela a ser inserida
INSERT INTO cursos_programacao ( 
	SELECT curso.id,
		   curso.nome
		FROM curso
);

DELETE FROM cursos_programacao;
SELECT * FROM curso;
