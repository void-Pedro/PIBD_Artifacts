--Função que retorna caronas disponíveis
--Verificar da onde pega o endereço e atualizar na função
CREATE OR REPLACE FUNCTION BuscarCarona(
    Saida IN VARCHAR2, 
    Destino IN varchar2, 
    DataSaida IN DATE, 
    NumPassageiro IN NUMBER) 	 
RETURN SYS_REFCURSOR 	 
IS 	 
	ccarona SYS_REFCURSOR;	 
BEGIN	 
	OPEN ccarona FOR	 
    	SELECT endereco_saida, endereco_chegada, Data_saida, Numero_max_pessoas, Valor  
    	FROM Viagem	 
    	WHERE endereco_saida = saida	 
        	AND endereco_chegada = destino	 
        	AND Data_saida = Data_Saida	 
        	AND Numero_max_pessoas >= numpassageiro;	 
RETURN ccarona;	 
END;
/
