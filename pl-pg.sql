CREATE OR REPLACE FUNCTION primeira_pl() RETURNS INTEGER AS $$ 
	DECLARE -- sintax para declarar variaveis
		primeira_variavel INTEGER DEFAULT 3; -- DEFAULT só funciona na declaração
		segund_variavel INTEGER := 7;

	BEGIN -- inico do bloco
		-- Posso usar vários comando em SQL
		
		primeira_variavel := primeira_variavel * 2;
		
		RETURN primeira_variavel; -- essa é a sintax do retorno
	END -- final do bloco
	-- essa é a sintax do PLPGSQL
$$ LANGUAGE plpgsql;
DROP FUNCTION primeira_pl;

SELECT primeira_pl();