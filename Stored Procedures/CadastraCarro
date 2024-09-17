CREATE PROCEDURE CadastraCarro
    @Renavam INT,
    @Placa VARCHAR(7),
    @Modelo VARCHAR(50),
    @Cor VARCHAR(30),

AS
BEGIN

IF EXISTS (SELECT 1 FROM Carro
WHERE Renavam= @Renavam)
BEGIN
PRINT 'Erro: Já existe um veículo com estes dados cadastrado.';
RETURN;
END

INSERT INTO Carro(Renavam, Placa, Modelo, Cor)
VALUES (@Renavam, @Placa, @Modelo, @Cor);

PRINT 'Veículo cadastrado com sucesso.';
END;
