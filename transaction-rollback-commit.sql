-- TRANSACTION serve para realizar uma sequencia de comandos dependentes entre sí
-- por exemplo em uma transferencia bancaria, mas pode ser outras coisas em outros contextos
BEGIN; -- comecando uma transacao
DELETE FROM aluno_curso;
ROLLBACK; -- revertendo a transacao

BEGIN;
DELETE FROM aluno_curso WHERE aluno_id = 1 AND curso_id = 4;
COMMIT; -- confirmando a transacao

SELECT * FROM aluno_curso;

-- TRANSACTION não são suportadas dentro da função, te se usar quando chama a função
CREATE OR REPLACE FUNCTION criar_intrutor() RETURNS instrutor AS $$
	BEGIN
	END;
$$ LANGUAGE plpgsql;


START TRANSACTION;
select * criar_intrutor();
COMMIT; --ou ROLLBACK
































































