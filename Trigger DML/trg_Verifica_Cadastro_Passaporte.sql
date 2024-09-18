CREATE TRIGGER trg_Verifica_Cadastro_Passaporte
ON Estrangeiro
AFTER INSERT
AS
BEGIN
    -- Variável para armazenar o número de passaportes duplicados
    DECLARE @cont INT;

    -- Verifica se o número de passaporte do registro inserido já existe na tabela
    SELECT @cont = COUNT(*)
    FROM Estrangeiro e
    INNER JOIN inserted i ON e.Numero_Passaporte = i.Numero_Passaporte;

    -- Se houver duplicidade, lança um erro
    IF @cont > 1
    BEGIN
        -- Lançar uma exceção para impedir a inserção
        RAISERROR('Erro: Já existe um usuário com o mesmo número de passaporte.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO