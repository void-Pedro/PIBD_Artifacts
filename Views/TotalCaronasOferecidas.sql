CREATE VIEW TotalCaronasOferecidas AS
SELECT caronistaID, COUNT(*) AS total_caronas_oferecidas
FROM Viagem
GROUP BY caronistaID;

CREATE FUNCTION ObterTotalCaronasOferecidas(caronistaID INT)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE total INT;

    -- Consulta a view para obter o total de caronas oferecidas por um caronista específico
    SELECT total_caronas
    INTO total
    FROM TotalCaronasOferecidas
    WHERE caronistaID = caronistaID;

    -- Retorna o total de caronas; se o caronista não tiver caronas, retorna 0
    RETURN COALESCE(total, 0);
END //
