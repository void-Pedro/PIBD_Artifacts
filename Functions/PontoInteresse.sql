--Se for diferente para cada usuário

CREATE OR REPLACE FUNCTION Ponto_Interesse( 
    user_id IN NUMBER) 
	RETURN SYS_REFCURSOR 
IS 
	cponto SYS_REFCURSOR;  
BEGIN  
	OPEN cponto FOR 
		SELECT endereco FROM Usuario_Pontos_Interesse 
		WHERE usuario_id = user_id; 
	RETURN cponto; 
END;
