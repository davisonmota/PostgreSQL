-- TRANSACTION serve para realizar uma sequencia de comandos dependentes entre sí
-- por exemplo em uma transferencia bancaria, mas pode ser outras coisas em outros contextos
BEGIN; -- comecando uma transacao
DELETE FROM aluno_curso;
ROLLBACK; -- revertendo a transacao

BEGIN;
DELETE FROM aluno_curso WHERE aluno_id = 1 AND curso_id = 4;
COMMIT; -- confirmando a transacao

SELECT * FROM aluno_curso;