CREATE PROCEDURE excluir_viagem(
	@id_viagem IN INT,
	@renavam IN INT,
	@caronista_ID IN INT
) IS
BEGIN
	DELETE FROM viagem
	WHERE id_viagem = @id_viagem
  	AND renavam = @renavam
  	AND caronista_ID = @caronista_ID;
    
	COMMIT;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
    	RAISE_APPLICATION_ERROR(-20002, 'Viagem não encontrada.');
	WHEN OTHERS THEN
    	ROLLBACK;
    	RAISE;
END excluir_viagem;
/
