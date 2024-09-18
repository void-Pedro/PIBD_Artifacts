CREATE TRIGGER trg_Avaliacoes_Caronista
ON AvaliacoesCaronista
AFTER INSERT
AS
BEGIN
    -- Atualiza a quantidade de avaliações para cada caronista após uma nova avaliação ser inserida
    UPDATE c
    SET c.quantidade_avaliacoes = (
        SELECT COUNT(*)
        FROM AvaliacoesCaronista ac
        WHERE ac.caroneiroID = c.ID_caronista
    )
    FROM caronista c
    INNER JOIN inserted i
    ON c.ID_caronista = i.caroneiroID;
END;
