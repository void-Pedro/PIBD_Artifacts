-- Autor: Ana Ellen
DELIMITER //

CREATE PROCEDURE GetViagemCaroneiro(IN caroneiroID INT)
BEGIN
    SELECT 
        v.ID_viagem,
        v.Data_hora_saida,
        v.Data_hora_chegada_estimada,
        v.Valor,

        pi.Logradouro,
        pi.Estado,
        pi.Cidade,

        c.Numero,
        c.Inicio,
        c.Fim,

        u.Nome_completo AS Nome_Caronista,
        car.Placa,
        car.Modelo,
        car.Cor
    FROM 
        vw_viagem v
    WHERE 
        ce.ID_caroneiro = caroneiroID
        AND v.Status_viagem = 'Em Andamento';
END //

DELIMITER ;
