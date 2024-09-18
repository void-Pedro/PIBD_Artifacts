CREATE FUNCTION fn_CalculaMediaNotasCaroneiro (@ID_caroneiro INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @media FLOAT;

    -- Calcula a média das notas para o caroneiro específico
    SELECT @media = AVG(CAST(nota AS FLOAT))
    FROM avaliacaoCaroneiro
    WHERE ID_caroneiro = @ID_caroneiro;

    -- Retorna a média
    RETURN ISNULL(@media, 0);  -- Retorna 0 caso não haja nenhuma nota para o caroneiro
END;
GO
