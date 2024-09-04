CREATE PROCEDURE SolicitarViagem
    @caroneiro_ID INT,
    @id_viagem INT
AS
BEGIN
    -- Verifica se a quantidade de passageiros já atingiu o máximo
    DECLARE @numero_atual_pessoas INT;
    DECLARE @numero_max_pessoas INT;

    SELECT @numero_max_pessoas = v.numero_max_pessoas,
           @numero_atual_pessoas = COUNT(s.caroneiro_ID)
    FROM viagem v
    LEFT JOIN solicita_viagem s ON v.id_viagem = s.id_viagem
    WHERE v.id_viagem = @id_viagem
    GROUP BY v.id_viagem;

    IF @numero_atual_pessoas >= @numero_max_pessoas
    BEGIN
        PRINT 'A viagem já atingiu o número máximo de pessoas';
        RETURN;
    END

    -- Verifica se o caroneiro já solicitou essa viagem
    IF EXISTS (SELECT 1 FROM solicita_viagem WHERE caroneiro_ID = @caroneiro_ID AND id_viagem = @id_viagem)
    BEGIN
        PRINT 'Erro: O caroneiro já solicitou esta viagem.';
        RETURN;
    END

    INSERT INTO solicita_viagem (caroneiro_ID, id_viagem, status)
    VALUES (@caroneiro_ID, @id_viagem, null);

    PRINT 'Viagem solicitada com sucesso.';
END;
