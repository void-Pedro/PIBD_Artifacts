CREATE PROCEDURE sp_InserirAvaliacaoCaroneiro
    @ID_caroneiro INT,
    @ID_viagem INT,
    @nota INT,
    @comentario VARCHAR(200)
AS
BEGIN
    -- Verifica se o caroneiro existe
    IF NOT EXISTS (SELECT 1 FROM caroneiro WHERE caroneiro_ID = @ID_caroneiro)
    BEGIN
        RAISERROR('O caroneiro com o ID especificado não existe.', 16, 1);
        RETURN;
    END

    -- Verifica se a viagem existe
    IF NOT EXISTS (SELECT 1 FROM viagem WHERE ID_viagem = @ID_viagem)
    BEGIN
        RAISERROR('A viagem com o ID especificado não existe.', 16, 1);
        RETURN;
    END

    -- Adiciona a avaliação
    INSERT INTO avaliacaoCaroneiro (ID_caroneiro, ID_viagem, nota, comentario)
    VALUES (@ID_caroneiro, @ID_viagem, @nota, @comentario);

    PRINT 'Avaliação adicionada com sucesso.';
END;
GO
