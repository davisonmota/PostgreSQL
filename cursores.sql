CREATE OR REPLACE FUNCTION primeira_pl() RETURNS INTEGER AS $$ 
	DECLARE -- sintax para declarar variaveis
		primeira_variavel INTEGER DEFAULT 3; -- DEFAULT só funciona na declaração
		segund_variavel INTEGER := 7;

	BEGIN -- inico do bloco
		-- Posso usar vários comando em SQL
		
		primeira_variavel := primeira_variavel * 2;
		
		RETURN primeira_varia vel; -- essa é a sintax do retorno
	END -- final do bloco
	-- essa é a sintax do PLPGSQL
$$ LANGUAGE plpgsql;
DROP FUNCTION primeira_pl;
SELECT primeira_pl();

CREATE TABLE instrutor(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	salario DECIMAL(10,2) NOT NULL
);

CREATE OR REPLACE FUNCTION criar_instrutor(nomeParam VARCHAR, salarioParam DECIMAL) RETURNS instrutor AS $$
	DECLARE 
		retorno instrutor;
	BEGIN
		INSERT INTO instrutor (nome, salario) VALUES (nomeParam, salarioParam);
		SELECT id, nome, salario From instrutor where instrutor.nome = nomeParam INTO retorno;
		RETURN retorno;
	END
$$ LANGUAGE plpgsql;
DROP FUNCTION criar_instrutor;

CREATE OR REPLACE FUNCTION filtrar_instrutor_pelo_salario(salarioParam DECIMAL) RETURNS SETOF instrutor AS $$
	BEGIN
		RETURN QUERY SELECT id, nome, salario From instrutor where instrutor.salario >= salarioParam;
	END
$$ LANGUAGE plpgsql;

SELECT * FROM instrutor;
SELECT * FROM criar_instrutor('São', 1800);
SELECT * FROM filtrar_instrutor_pelo_salario(1800);


-- IF-ELSE
CREATE OR REPLACE FUNCTION salario_ok(instrutor instrutor) RETURNS VARCHAR AS $$
	BEGIN
		IF instrutor.salario > 1600 THEN
			RETURN 'Salário está ok!';
		ELSE 
 			RETURN 'Salário pode aumentar.';
		END IF;
	END;
$$ LANGUAGE plpgsql; 

SELECT nome, salario_ok(instrutor.*) FROM instrutor;

-- CASE WHEN THEN
CREATE OR REPLACE FUNCTION salario(instrutor instrutor) RETURNS VARCHAR AS $$
	BEGIN
		/*CASE
			WHEN instrutor.salario = 100 THEN
				RETURN 'Salário muiot baixo';
			WHEN instrutor.salario = 200 THEN
				RETURN 'Salário baixo';
			WHEN instrutor.salario = 1000 THEN
				RETURN 'Salário ok';
			ELSE 
				RETURN 'Salário ótimo';
		END CASE;*/
		CASE instrutor.salario
			WHEN 100 THEN
				RETURN 'Salário muiot baixo';
			WHEN 200 THEN
				RETURN 'Salário baixo';
			WHEN 1000 THEN
				RETURN 'Salário ok';
			ELSE 
				RETURN 'Salário ótimo';
		END CASE;
	END;
$$ LANGUAGE plpgsql; 

-- Esturtura de Repetição LOOP e NEXT
CREATE OR REPLACE FUNCTION tabuada(numero INTEGER) RETURNS SETOF VARCHAR as $$
	DECLARE
		multiplo INTEGER DEFAULT 1;
	BEGIN
		LOOP 
			RETURN NEXT CONCAT(numero, ' x ', multiplo, ' = ', numero * multiplo);
			multiplo := multiplo + 1;
			
			EXIT WHEN multiplo = 10; 
		END LOOP;
	END;
$$ LANGUAGE plpgsql; 
DROP FUNCTION tabuada;

select tabuada(3);

-- Esturtura de Repetição WHILE
CREATE OR REPLACE FUNCTION tabuadaWhile(numero INTEGER) RETURNS SETOF VARCHAR as $$
	DECLARE
		multiplo INTEGER DEFAULT 1;
	BEGIN
		WHILE multiplo < 10 LOOP
			RETURN NEXT CONCAT(numero, ' x ', multiplo, ' = ', numero * multiplo);
			multiplo := multiplo + 1;
			
		END LOOP;
	END;
$$ LANGUAGE plpgsql;

select tabuadaWhile(8);



-- Esturtura de Repetição FOR
CREATE OR REPLACE FUNCTION tabuadaFOR(numero INTEGER) RETURNS SETOF VARCHAR as $$
	/*DECLARE -- No FOR não é prociso nem declarar o contador
		multiplo INTEGER DEFAULT 1;
		
		*/
	BEGIN
		FOR multiplo IN 1..9 LOOP
			RETURN NEXT CONCAT(numero, ' x ', multiplo, ' = ', numero * multiplo);
			-- multiplo := multiplo + 1; -- Nesse caso não é necessário essa linha
			
		END LOOP;
	END;
$$ LANGUAGE plpgsql;

select tabuadaFOR(7);

-- Esturtura de Repetição FOR no SELECT
CREATE OR REPLACE FUNCTION instrucor_com_salario(OUT nome VARCHAR, OUT salario_ok VARCHAR) RETURNS SETOF record as $$
	DECLARE
		instrutor instrutor;
	BEGIN
		FOR instrutor  IN SELECT * FROM instrutor LOOP
			nome := instrutor.nome;
			salario_ok := instrutor.salario;
			RETURN NEXT;
		END LOOP;
		EXCEPTION
			--especifica o error, tem todos na documentação
			RAISE NOTICE 'Algo errado'; -- RAISE ERRORS and MESSAGES
			WHEN undefined_colum THEN
				-- instruçao caso error aconteça
			WHEN outro_erro THEN
				-- tratamentos diferante para cada error
	
	END;
$$ LANGUAGE plpgsql;

select * FROM instrucor_com_salario();












