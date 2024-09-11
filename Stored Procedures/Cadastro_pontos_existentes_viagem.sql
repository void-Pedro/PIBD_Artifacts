-- Autor: Ana Ellen
DELIMITER //

CREATE PROCEDURE InserirPontoIntermediarioExistente(
    IN p_id_viagem INT,
    IN p_CEP INT,
	IN p_rua INT,
    IN p_numero INT,
    IN p_data_chegada DATE,
    IN p_horario_chegada TIME,
    IN p_horario_saida TIME
)
BEGIN
    -- Inserir na tabela ponto_intermediario_viagem
    INSERT INTO ponto_intermediario_viagem(
        ID_viagem, 
        CEP_ponto, 
        Numero_ponto, 
        Bairro, 
        Cidade, 
        Estado, 
        Data_chegada, 
        Horario_chegada, 
        Horario_saida
    )
    SELECT 
        p_id_viagem, 
        p_CEP, 
        p_numero,
        Bairro,
        Cidade,
        Estado,
        p_datahora_chegada, 
        p_datahora_saida
    FROM 
        Pontos_intermediarios 
    WHERE 
        CEP = p_CEP AND Rua = p_rua AND Numero = p_numero;
END //

DELIMITER ;
