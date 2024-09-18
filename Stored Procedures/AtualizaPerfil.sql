--Procedure para atualizar informaçãp de perfil(não é obrigatório alterar tudo)

CREATE PROCEDURE AtualizaPerfil(
    @ID_usuario INT,
    @RedeSocial NVARCHAR(100) = NULL,
    @DDI INT = NULL,
    @DDD INT = NULL,
    @NumTelefone INT = NULL)
AS
BEGIN
	--Atualizando informações do usuário
	BEGIN TRY
		UPDATE usuario_geral
		SET rede_social = COALESCE(@RedeSocial, rede_social),
			DDI = COALESCE(@DDI, DDI),
			DDD = COALESCE(@DDD, DDD),
			num_telefone = COALESCE(@NumTelefone, num_telefone)
		WHERE ID = @ID_usuario;
	END TRY

	--Se der erro
	BEGIN CATCH
		PRINT 'Erro ao atualizar perfil: ' + ERROR_MESSAGE();
    END CATCH
END;
