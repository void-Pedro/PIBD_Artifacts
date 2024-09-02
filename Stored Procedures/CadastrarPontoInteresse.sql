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
    -- Verifica se o ponto de interesse já existe no mesmo endereço
    IF EXISTS (SELECT 1 FROM PontosDeInteresse 
               WHERE CEP = @CEP AND Numero = @Numero)
    BEGIN
        PRINT 'Erro: Já existe um ponto de interesse cadastrado neste endereço.';
        RETURN;
    END

    -- Inserindo o novo ponto de interesse na tabela PontosDeInteresse
    INSERT INTO PontosDeInteresse (CEP, Rua, Numero, Complemento, Bairro, Cidade, Estado)
    VALUES (@CEP, @Rua, @Numero, @Complemento, @Bairro, @Cidade, @Estado);

    -- Mensagem de confirmação
    PRINT 'Ponto de interesse cadastrado com sucesso.';
END;
