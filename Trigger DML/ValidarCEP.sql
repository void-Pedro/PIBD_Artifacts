CREATE TRIGGER trg_ValidarCEP
ON dbo.pontos_intermediarios
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE LEN(i.CEP) <> 8
           OR i.CEP LIKE '%[^0-9]%'
    )
    BEGIN
        RAISERROR('O CEP digitado é inválido. Inclua apenas números ou verifique o tamanho', 16, 1)
        ROLLBACK TRANSACTION
    END
END
GO
