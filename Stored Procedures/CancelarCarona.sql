CREATE PROCEDURE ExcluirSolicitacaoViagem
    @caroneiro_ID INT,
    @id_viagem INT
AS
BEGIN
    -- Se existir a viagem, a exclui
    IF EXISTS (SELECT 1 FROM solicita_viagem 
               WHERE caroneiro_ID = @caroneiro_ID AND id_viagem = @id_viagem)
    BEGIN
        DELETE FROM solicita_viagem
        WHERE caroneiro_ID = @caroneiro_ID AND id_viagem = @id_viagem;
        PRINT 'Solicitação excluída com sucesso.';
    END
    ELSE
    BEGIN
        PRINT 'Erro: Solicitação não encontrada.';
    END
END;