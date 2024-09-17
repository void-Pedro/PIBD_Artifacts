CREATE PROCEDURE deletar_usuario(
	@ID IN INT
) IS
BEGIN
	-- Deletar registros relacionados nas tabelas dependentes
	DELETE FROM estrangeiro
	WHERE ID_usuario = @ID;
    
	DELETE FROM brasileiro
	WHERE ID_usuario = @ID;
    
	DELETE FROM caronista
	WHERE caronista_ID = @ID;
    
	DELETE FROM caroneiro
	WHERE caroneiro_ID = @ID;

	-- Deletar o usuário da tabela usuario_geral
	DELETE FROM usuario_geral
	WHERE ID = @ID;

	COMMIT;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
    	RAISE_APPLICATION_ERROR(-20001, 'Usuário ou dependências não encontradas.');
	WHEN OTHERS THEN
    	ROLLBACK;
    	RAISE;
END deletar_usuario;
/
