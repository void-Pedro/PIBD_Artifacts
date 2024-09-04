--Verifica se usuário já tem cadastro, baseado no CPF ou Passaporte
CREATE OR REPLACE FUNCTION VerificaCadastroUsuario( 
    CPF IN NUMBER, 
    Passaporte IN VARCHAR2) 
		RETURN BOOLEAN 
IS
    cont NUMBER;
BEGIN 
	SELECT COUNT(*) INTO cont 
    FROM Usuario_Geral ug 
	LEFT JOIN Brasileiro b ON ug.ID = b.ID_usuario 
	LEFT JOIN Estrangeiro e ON ug.ID = e.ID_usuario 
	WHERE (b.CPF = CPF AND CPF IS NOT NULL)  
		OR (e.numero_passaporte = Passaporte AND Passaporte IS NOT NULL); 

	IF cont > 0 THEN
        RETURN TRUE;
    ELSE 
        RETURN FALSE;
	END IF;
END; 
/
