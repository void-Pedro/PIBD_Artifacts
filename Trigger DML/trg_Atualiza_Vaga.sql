/*
CREATE OR REPLACE TRIGGER trg_Atualiza_Vaga
	AFTER INSERT 
    ON Caroneiro_viagem
	FOR EACH ROW
BEGIN
	UPDATE Viagem
	SET Numero_max_pessoas = Numero_max_pessoas - 1
	WHERE ID_viagem = :NEW.ID_viagem;
END;
*/

CREATE TRIGGER trg_Atualiza_Vaga
    ON caroneiro_viagem
	AFTER INSERT 
AS
BEGIN
	UPDATE viagem
	SET numero_max_pessoas = numero_max_pessoas - 1
	FROM viagem v
	INNER JOIN INSERTED i ON v.ID_viagem = i.ID_viagem;
END;
