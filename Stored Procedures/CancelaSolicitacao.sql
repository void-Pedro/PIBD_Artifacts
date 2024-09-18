CREATE PROCEDURE sp_CancelarSolicitacaoViagem
    @ID_caroneiro INT,
    @ID_viagem INT
AS
BEGIN
    -- Verifica se a solicitação existe
    IF NOT EXISTS (SELECT 1 FROM solicita_viagem WHERE ID_caroneiro = @ID_caroneiro AND ID_viagem = @ID_viagem)
    BEGIN
        RAISERROR('A solicitação de viagem com os IDs especificados não existe.', 16, 1);
        RETURN;
    END

    -- Atualiza o status para indicar o cancelamento
    UPDATE solicita_viagem
    SET status = 0  -- 0 representa "cancelado", 1 representa "ativo"
    WHERE ID_caroneiro = @ID_caroneiro AND ID_viagem = @ID_viagem;

    PRINT 'Solicitação de viagem cancelada com sucesso.';
END;
GO
