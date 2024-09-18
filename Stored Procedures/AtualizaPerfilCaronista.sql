--Procedure para atualizar informaçãp de perfil(não é obrigatório alterar tudo)

CREATE PROCEDURE AtualizaPerfilCaronista(
    @ID_caronista INT,
    @data_nascimento DATE = NULL,
    @data_validade_cnh DATE = NULL,
AS
BEGIN
	--Atualizando informações do usuário
	BEGIN TRY
		UPDATE caronista
    SET data_nascimento = COALESCE(@data_nascimento, data_nascimento),
		SET data_validade_cnh = COALESCE(@data_validade_cnh, data_validade_cnh),
		WHERE ID_caronista = @ID_caronista;
	END TRY

	--Se der erro
	BEGIN CATCH
		PRINT 'Erro ao atualizar perfil: ' + ERROR_MESSAGE();
    END CATCH
END;
