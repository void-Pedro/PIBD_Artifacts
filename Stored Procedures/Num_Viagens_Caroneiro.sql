--Atualiza número de viagens que um caroneiro já aceitou
--Falta testar

CREATE OR REPLACE PROCEDURE Num_Viagens_Caroneiro(
    num_viagens IN NUMBER,
    status_viagem IN status_viagem_enum)
IS
BEGIN
    UPDATE caroneiro
    SET c.viagens_feitas =  (
    	SELECT COUNT(c.viagens_feitas)
        FROM caroneiro c INNER JOIN viagem v
        ON c.ID_caroneiro = v.ID_caroneiro
        WHERE v.status_viagem = 'Finalizada');
END;
/
