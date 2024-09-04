CREATE PROCEDURE AceitarSolicitacaoViagem
    @caroneiro_ID INT,
    @id_viagem INT
AS
BEGIN
    -- Se existir, aceita a solicitação
    IF EXISTS (SELECT 1 FROM solicita_viagem 
               WHERE caroneiro_ID = @caroneiro_ID AND id_viagem = @id_viagem)
    BEGIN
        UPDATE solicita_viagem
        SET status = TRUE
        WHERE caroneiro_ID = @caroneiro_ID AND id_viagem = @id_viagem;

        PRINT 'Solicitação aceita com sucesso.';
    END
    ELSE
    BEGIN
        PRINT 'Erro: Solicitação de viagem não encontrada.';
    END
END;
