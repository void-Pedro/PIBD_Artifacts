CREATE PROCEDURE AceitarSolicitacaoViagem
    @ID_caroneiro INT,
    @ID_viagem INT
AS
BEGIN
    -- Se existir, aceita a solicitação
    IF EXISTS (SELECT 1 FROM solicita_viagem 
               WHERE ID_caroneiro = @ID_caroneiro AND ID_viagem = @ID_viagem)
    BEGIN
        UPDATE solicita_viagem
        SET status = TRUE
        WHERE ID_caroneiro = @ID_caroneiro AND ID_viagem = @ID_viagem;

        PRINT 'Solicitação aceita com sucesso.';
    END
    ELSE
    BEGIN
        PRINT 'Erro: Solicitação de viagem não encontrada.';
    END
END;
