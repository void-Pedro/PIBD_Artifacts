CREATE PROCEDURE CadastrarCaronista
    @caronista_ID INT,
    @numero_cnh INT,
    @data_validade_cnh VARCHAR(50),
    @viagens_feitas INT,
    @quantidade_avaliacoes INT
AS
BEGIN
    -- Verifica se o caronista_ID existe na tabela usuario_geral
    IF NOT EXISTS (SELECT 1 FROM usuario_geral WHERE ID = @caronista_ID)
    BEGIN
        PRINT 'Erro: O caronista_ID não existe na tabela usuario_geral.';
        RETURN;
    END

    -- Verifica se já existe um caronista com o mesmo caronista_ID e numero_cnh
    IF EXISTS (SELECT 1 FROM caronista 
               WHERE caronista_ID = @caronista_ID AND numero_cnh = @numero_cnh)
    BEGIN
        PRINT 'Erro: Já existe um caronista cadastrado com este ID e número da CNH.';
        RETURN;
    END

    -- Insere o novo caronista na tabela caronista
    INSERT INTO caronista (
        caronista_ID,
        numero_cnh,
        data_validade_cnh,
        viagens_feitas,
        quantidade_avaliacoes
    )
    VALUES (
        @caronista_ID,
        @numero_cnh,
        @data_validade_cnh,
        @viagens_feitas,
        @quantidade_avaliacoes
    );

    PRINT 'Caronista cadastrado com sucesso.';
END;
/
