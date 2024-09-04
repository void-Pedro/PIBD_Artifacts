DELIMITER //

CREATE PROCEDURE InserirNovoPontoIntermediario(
    IN p_id_viagem INT,
    IN p_CEP INT,
    IN p_rua VARCHAR(100),
    IN p_numero INT,
    IN p_bairro VARCHAR(100),
    IN p_cidade VARCHAR(100),
    IN p_estado VARCHAR(100),
    IN p_data_chegada DATE,
    IN p_horario_chegada TIME,
    IN p_horario_saida TIME
)
BEGIN
    -- Verificar se o ponto intermediário já existe
    IF NOT EXISTS (
        SELECT 1 
        FROM Pontos_intermediarios 
        WHERE CEP = p_CEP AND numero = p_numero
    ) THEN
        -- Inserir o novo ponto intermediário
        INSERT INTO Pontos_intermediarios(
            CEP, 
            Rua, 
            Numero, 
            Bairro, 
            Cidade, 
            Estado
        ) VALUES (
            p_CEP, 
            p_rua, 
            p_numero, 
            p_bairro, 
            p_cidade, 
            p_estado
        );
    END IF;

    -- Associar o ponto intermediário à viagem
    INSERT INTO Ponto_intermediario_viagem(
        ID_viagem, 
        CEP_ponto, 
        Numero_ponto, 
        Bairro, 
        Cidade, 
        Estado, 
        Data_chegada, 
        Horario_chegada, 
        Horario_saida
    ) VALUES (
        p_id_viagem, 
        p_CEP, 
        p_numero, 
        p_bairro, 
        p_cidade, 
        p_estado, 
        p_data_chegada, 
        p_horario_chegada, 
        p_horario_saida
    );
END //

DELIMITER ;
