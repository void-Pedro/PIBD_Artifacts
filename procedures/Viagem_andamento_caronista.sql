DELIMITER //

CREATE PROCEDURE GetViagemCaronista(IN caronistaID INT)
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

        u.Nome_completo AS Nome_Caroneiro
    FROM 
        vw_viagem v
    WHERE 
        ci.ID_caronista = caronistaID
        AND v.Status_viagem = 'Em Andamento';
END //

DELIMITER ;
