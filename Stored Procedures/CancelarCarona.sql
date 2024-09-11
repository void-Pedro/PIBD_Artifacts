CREATE PROCEDURE ExcluirSolicitacaoViagem
    @ID_caroneiro INT,
    @ID_viagem INT
AS
BEGIN
    -- Se existir a viagem, a exclui
    IF EXISTS (SELECT 1 FROM solicita_viagem 
               WHERE ID_caroneiro = @ID_caroneiro AND ID_viagem = @ID_viagem)
    BEGIN
        DELETE FROM solicita_viagem
        WHERE ID_caroneiro = @ID_caroneiro AND ID_viagem = @ID_viagem;
        PRINT 'Solicitação excluída com sucesso.';
    END
    ELSE
    BEGIN
        PRINT 'Erro: Solicitação não encontrada.';
    END
END;