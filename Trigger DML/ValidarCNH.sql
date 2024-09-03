CREATE TRIGGER trg_ValidarCNH
ON dbo.Caronista
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @cnh NVARCHAR(11)
    DECLARE @cnhBase NVARCHAR(9)
    DECLARE @primeiroDV INT
    DECLARE @segundoDV INT
    DECLARE @somaPrimeiroDV INT
    DECLARE @somaSegundoDV INT

    SELECT @cnh = i.numero_cnh
    FROM inserted i

    SET @cnhBase = LEFT(@cnh, 9)

    -- Primeiro Dígito Verificador
    SET @somaPrimeiroDV = (SUBSTRING(@cnhBase, 1, 1) * 2) +
                          (SUBSTRING(@cnhBase, 2, 1) * 3) +
                          (SUBSTRING(@cnhBase, 3, 1) * 4) +
                          (SUBSTRING(@cnhBase, 4, 1) * 5) +
                          (SUBSTRING(@cnhBase, 5, 1) * 6) +
                          (SUBSTRING(@cnhBase, 6, 1) * 7) +
                          (SUBSTRING(@cnhBase, 7, 1) * 8) +
                          (SUBSTRING(@cnhBase, 8, 1) * 9) +
                          (SUBSTRING(@cnhBase, 9, 1) * 10)
    SET @primeiroDV = @somaPrimeiroDV % 11
    IF @primeiroDV = 10 SET @primeiroDV = 0

    -- Segundo dígito verificador
    SET @somaSegundoDV = (SUBSTRING(@cnhBase, 1, 1) * 3) +
                         (SUBSTRING(@cnhBase, 2, 1) * 4) +
                         (SUBSTRING(@cnhBase, 3, 1) * 5) +
                         (SUBSTRING(@cnhBase, 4, 1) * 6) +
                         (SUBSTRING(@cnhBase, 5, 1) * 7) +
                         (SUBSTRING(@cnhBase, 6, 1) * 8) +
                         (SUBSTRING(@cnhBase, 7, 1) * 9) +
                         (SUBSTRING(@cnhBase, 8, 1) * 10) +
                         (SUBSTRING(@cnhBase, 9, 1) * 11)
    SET @segundoDV = @somaSegundoDV % 11
    IF @segundoDV = 10 SET @segundoDV = 0

    -- Verifica os dígitos calculados com os da cnh
    IF RIGHT(@cnh, 2) <> CAST(@primeiroDV AS NVARCHAR) + CAST(@segundoDV AS NVARCHAR)
    BEGIN
        RAISERROR('A CNH digitada é inválida')
        ROLLBACK TRANSACTION
    END
END
GO
