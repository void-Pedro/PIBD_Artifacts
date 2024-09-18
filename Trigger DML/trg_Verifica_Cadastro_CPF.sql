CREATE TRIGGER trg_Verifica_Cadastro_CPF
ON Brasileiro
AFTER INSERT
AS
BEGIN
    -- Variável para armazenar o número de CPFs duplicados
    DECLARE @cont INT;

    -- Verifica se o CPF do registro inserido já existe na tabela
    SELECT @cont = COUNT(*)
    FROM Brasileiro b
    INNER JOIN inserted i ON b.CPF = i.CPF;

    -- Se houver duplicidade, lança um erro
    IF @cont > 1
    BEGIN
        -- Lançar uma exceção para impedir a inserção
        RAISERROR('Erro: Já existe um usuário com o mesmo CPF.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
