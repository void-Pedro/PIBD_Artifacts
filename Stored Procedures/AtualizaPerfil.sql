CREATE OR REPLACE PROCEDURE AtualizaPerfil(
    ID_usuario IN NUMBER,
    nRedeSocial IN VARCHAR2,
    nDDI IN NUMBER,
    nDDD IN NUMBER,
    nNumTelefone IN NUMBER)
IS
BEGIN
	UPDATE Usuario_Geral
	SET RedeSocial = COALESCE(nRedeSocial, RedeSocial),
		DDI = COALESCE(nDDI, DDI),
		DDD = COALESCE(nDDD, DDD),
		num_telefone = COALESCE(nNumTelefone, num_telefone)
	WHERE ID = ID_usuario;

EXCEPTION 
    WHEN OTHERS THEN
    	DBMS_OUTPUT.PUT_LINE('Erro ao atualizar perfil ' || SQLERRM);
END;