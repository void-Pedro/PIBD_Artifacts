CREATE FUNCTION fn_CalculaMediaNotasCaronista (@ID_caronista INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @media FLOAT;

    -- Calcula a média das notas dos caronistas para o caronista específico
    SELECT @media = AVG(CAST(ac.nota AS FLOAT))
    FROM avaliacaoCaronista ac
    JOIN viagem v ON ac.ID_viagem = v.ID_viagem
    WHERE v.ID_caronista = @ID_caronista;

    -- Retorna a média
    RETURN ISNULL(@media, 0);  -- Retorna 0 caso não haja nenhuma nota para o caronista
END;
GO