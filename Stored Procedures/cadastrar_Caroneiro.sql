CREATE PROCEDURE CadastrarCaroneiro
	@caroneiro_ID INT,
	@viagens_aceitas INT
AS
BEGIN
	-- Verifica se o caroneiro_ID existe na tabela usuario_geral
	IF NOT EXISTS (SELECT 1 FROM usuario_geral WHERE ID = @caroneiro_ID)
	BEGIN
    	PRINT 'Erro: O caroneiro_ID não existe na tabela usuario_geral.';
    	RETURN;
	END

	-- Verifica se já existe um caroneiro com o mesmo caroneiro_ID
	IF EXISTS (SELECT 1 FROM caroneiro
           	WHERE caroneiro_ID = @caroneiro_ID)
	BEGIN
    	PRINT 'Erro: Já existe um caroneiro cadastrado com este ID.';
    	RETURN;
	END

	-- Insere o novo caroneiro na tabela caroneiro
	INSERT INTO caroneiro (
    	caroneiro_ID,
    	viagens_aceitas
	)
	VALUES (
    	@caroneiro_ID,
    	@viagens_aceitas
	);

	PRINT 'Caroneiro cadastrado com sucesso.';
END;

/
