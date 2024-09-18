CREATE OR REPLACE PROCEDURE AtualizaPerfil(
    @ID_usuario INT,
    @RedeSocial NVARCHAR(100) = NULL,
    @DDI INT = NULL,
    @DDD INT = NULL,
    @NumTelefone INT = NULL)
AS
BEGIN
	BEGIN TRY
		UPDATE Usuario_Geral
		SET rede_social = COALESCE(@RedeSocial, rede_social),
			DDI = COALESCE(@DDI, DDI),
			DDD = COALESCE(@DDD, DDD),
			num_telefone = COALESCE(@NumTelefone, num_telefone)
		WHERE ID = @ID_usuario;
	END TRY

	BEGIN CATCH
		PRINT 'Erro ao atualizar perfil: ' + ERROR_MESSAGE();
    END CATCH
END;
