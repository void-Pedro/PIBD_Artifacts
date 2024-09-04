CREATE TRIGGER trg_ValidarRenavam
ON Carro
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE LEN(i.renavam) <> 11
           OR i.renavam LIKE '%[^0-9]%'
    )
    BEGIN
        RAISERROR('O RENAVAM digitado é inválido. Inclua apenas números', 16, 1)
        ROLLBACK TRANSACTION
    END
END
GO
