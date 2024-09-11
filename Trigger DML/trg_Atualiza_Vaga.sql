CREATE OR REPLACE TRIGGER trg_Atualiza_Vaga
	AFTER INSERT 
    ON Caroneiro_viagem
	FOR EACH ROW
BEGIN
	UPDATE Viagem
	SET Numero_max_pessoas = Numero_max_pessoas - 1
	WHERE ID_viagem = :NEW.ID_viagem;
END;
/