CREATE PROCEDURE CadastrarCaronista
    @ID_caronista INT,
    @numero_cnh INT,
    @data_validade_cnh VARCHAR(50),
    @viagens_feitas INT,
    @quantidade_avaliacoes INT
AS
BEGIN
    -- Verifica se o ID_caronista existe na tabela usuario_geral
    IF NOT EXISTS (SELECT 1 FROM usuario_geral WHERE ID = @ID_caronista)
    BEGIN
        PRINT 'Erro: O ID_caronista não existe na tabela usuario_geral.';
        RETURN;
    END

    -- Verifica se já existe um caronista com o mesmo ID_caronista e numero_cnh
    IF EXISTS (SELECT 1 FROM caronista 
               WHERE ID_caronista = @ID_caronista AND numero_cnh = @numero_cnh)
    BEGIN
        PRINT 'Erro: Já existe um caronista cadastrado com este ID e número da CNH.';
        RETURN;
    END

    -- Insere o novo caronista na tabela caronista
    INSERT INTO caronista (
        ID_caronista,
        numero_cnh,
        data_validade_cnh,
        viagens_feitas,
        quantidade_avaliacoes
    )
    VALUES (
        @ID_caronista,
        @numero_cnh,
        @data_validade_cnh,
        @viagens_feitas,
        @quantidade_avaliacoes
    );

    PRINT 'Caronista cadastrado com sucesso.';
END;
/
