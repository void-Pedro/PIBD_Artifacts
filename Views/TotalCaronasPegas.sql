CREATE VIEW TotalCaronasPegas AS
SELECT caronistaID, COUNT(*) AS total_caronas_pegas
FROM Viagem
GROUP BY caroneiroID; 

CREATE FUNCTION ObterTotalCaronasPorCaroneiro(caroneiroID INT)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE total INT;

    -- Consulta a tabela de caronas para obter o total de caronas pegadas por um caroneiro específico
    SELECT COUNT(*) 
    INTO total
    FROM Caronas
    WHERE caroneiroID = caroneiroID;

    -- Retorna o total de caronas; se o caroneiro não tiver pego nenhuma carona, retorna 0
    RETURN COALESCE(total, 0);
END
