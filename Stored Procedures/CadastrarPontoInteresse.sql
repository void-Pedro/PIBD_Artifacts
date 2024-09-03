CREATE PROCEDURE CadastrarPontoDeInteresse
    @CEP VARCHAR(10),
    @Rua VARCHAR(100),
    @Numero VARCHAR(10),
    @Complemento VARCHAR(50),
    @Bairro VARCHAR(50),
    @Cidade VARCHAR(50),
    @Estado VARCHAR(2)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM PontosDeInteresse 
               WHERE CEP = @CEP AND Numero = @Numero)
    BEGIN
        PRINT 'Erro: Já existe um ponto de interesse cadastrado neste endereço.';
        RETURN;
    END

    INSERT INTO PontosDeInteresse (CEP, Rua, Numero, Complemento, Bairro, Cidade, Estado)
    VALUES (@CEP, @Rua, @Numero, @Complemento, @Bairro, @Cidade, @Estado);

    PRINT 'Ponto de interesse cadastrado com sucesso.';
END;
