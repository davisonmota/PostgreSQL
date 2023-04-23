CREATE FUNCTION soma(num1 INTEGER, NUM2 INTEGER) RETURNS INTEGER AS $$
	SELECT num1 + num2;
$$ LANGUAGE SQL;


CREATE FUNCTION soma2(INTEGER, INTEGER) RETURNS INTEGER AS $$
	SELECT $1 + $2;
$$ LANGUAGE SQL;
DROP FUNCTION soma2;

SELECT soma(2, 7); 
SELECT soma2(4, 17);


CREATE TABLE instrutor(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	salario DECIMAL(10,2)
);

INSERT INTO instrutor (nome, salario) VALUES ('Dávison', 3500);
INSERT INTO instrutor (nome, salario) VALUES  ('Douglas', 1800);
INSERT INTO instrutor (nome, salario) VALUES  ('Wesley', 1500);
INSERT INTO instrutor (nome, salario) VALUES  ('Warlyson', 600);

-- Aqui 'instrutor' é tipo, porque é uma tabela
CREATE FUNCTION dobrarSalario(instrutor) RETURNS DECIMAL AS $$
	SELECT $1.salario *2;
$$ LANGUAGE SQL;
DROP FUNCTION dobrarSalario;

SELECT nome, dobrarSalario(instrutor.*) 
	FROM instrutor where instrutor.nome = 'Dávison';

DROP FUNCTION instrutoresBemPagos;
-- SETOF conjunto de, para retornar mais de uma linha;
-- sem o SETOF irá retornar somente uma linha
-- mais comum
CREATE FUNCTION instrutoresBemPagos(valor DECIMAL) RETURNS SETOF instrutor AS $$ 
	SELECT * FROM instrutor WHERE salario >= valor;
$$ LANGUAGE SQL;
-- Outra sintax para retornar uma tabela, mais de um valor
CREATE FUNCTION instrutoresBemPagos(valor DECIMAL) 
	RETURNS TABLE (id INTEGER, nome VARCHAR, salario DECIMAL) AS $$ 
		SELECT * FROM instrutor WHERE salario >= valor;
$$ LANGUAGE SQL;

SELECT * FROM instrutoresBemPagos(300);

-- Usando o OUT
CREATE FUNCTION soma_e_produto(IN num1 INTEGER, IN num2 INTEGER, OUT soma INTEGER, OUT produto INTEGER) AS $$ 
	SELECT num1+num2 AS soma, num1*num2 as produto;
$$ LANGUAGE SQL;
DROP FUNCTION soma_e_produto;


CREATE TYPE retorno AS (soma INTEGER, produto INTEGER); -- usar tipo é mais legível
CREATE FUNCTION soma_e_produto(IN num1 INTEGER, IN num2 INTEGER) RETURNS retorno AS $$ 
	SELECT num1+num2 AS soma, num1*num2 as produto;
$$ LANGUAGE SQL;
DROP FUNCTION soma_e_produto;

SELECT * FROM soma_e_produto(5, 3);









