--Verificação de cadastro utilizando CPF

CREATE OR REPLACE TRIGGER trg_Verifica_Cadastro_CPF
	BEFORE INSERT
	ON Brasileiro
	FOR EACH ROW
DECLARE
	cont NUMBER;
BEGIN
    SELECT COUNT(*) INTO cont
    FROM Brasileiro b
    WHERE b.CPF = :NEW.CPF;

    IF cont > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro: Já existe um usuário com o mesmo CPF.');
    END IF;
END;
/
