--Verificação de cadastro utilizando passaporte

CREATE OR REPLACE TRIGGER trg_Verifica_Cadastro_Passaporte
	BEFORE INSERT
	ON Estrangeiro
	FOR EACH ROW
DECLARE
	cont NUMBER;
BEGIN
    SELECT COUNT(*) INTO cont
    FROM Estrangeiro e
    WHERE e.Numero_Passaporte = :NEW.Numero_Passaporte;

    IF cont > 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erro: Já existe um usuário com o mesmo núnero de passaporte.');
    END IF;
END;
/
