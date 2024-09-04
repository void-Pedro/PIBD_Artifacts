CREATE TRIGGER trg_ValidarCEP
ON PontosDeInteresse
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
        RAISERROR('O CEP digitado é inválido. Inclua apenas números', 16, 1)
        ROLLBACK TRANSACTION
    END
END
GO
