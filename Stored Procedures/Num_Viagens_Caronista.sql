--Atualiza número de viagens que um caronista já fez
--Testar antes
CREATE OR REPLACE PROCEDURE Num_Viagens_Caronista(
    num_viagens IN NUMBER,
    status_viagem IN status_viagem_enum)
IS
BEGIN
    UPDATE caronista
    SET c.viagens_feitas =  (
    	  SELECT COUNT(c.viagens_feitas)
        FROM caronista c INNER JOIN viagem v
        ON c.ID_caroneiro = v.ID_caroneiro
        WHERE v.status_viagem = 'Finalizada');
END;
/
