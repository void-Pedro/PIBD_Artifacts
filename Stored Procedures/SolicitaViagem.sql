CREATE PROCEDURE SolicitarViagem
    @ID_caroneiro INT,
    @ID_viagem INT
AS
BEGIN
    -- Verifica se a quantidade de passageiros já atingiu o máximo
    DECLARE @numero_atual_pessoas INT;
    DECLARE @numero_max_pessoas INT;

    SELECT @numero_max_pessoas = v.numero_max_pessoas,
           @numero_atual_pessoas = COUNT(s.ID_caroneiro)
    FROM viagem v
    LEFT JOIN solicita_viagem s ON v.ID_viagem = s.ID_viagem
    WHERE v.ID_viagem = @ID_viagem
    GROUP BY v.ID_viagem;

    IF @numero_atual_pessoas >= @numero_max_pessoas
    BEGIN
        PRINT 'A viagem já atingiu o número máximo de pessoas';
        RETURN;
    END

    -- Verifica se o caroneiro já solicitou essa viagem
    IF EXISTS (SELECT 1 FROM solicita_viagem WHERE ID_caroneiro = @ID_caroneiro AND ID_viagem = @ID_viagem)
    BEGIN
        PRINT 'Erro: O caroneiro já solicitou esta viagem.';
        RETURN;
    END

    INSERT INTO solicita_viagem (ID_caroneiro, ID_viagem, status)
    VALUES (@ID_caroneiro, @ID_viagem, null);

    PRINT 'Viagem solicitada com sucesso.';
END;
