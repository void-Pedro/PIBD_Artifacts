--Função não funciona no SQL Server

/*CREATE OR REPLACE FUNCTION BuscarCarona(
	Cidade_saida IN VARCHAR2,
	DataSaida IN DATE,
	Cidade_chegada IN VARCHAR2,
	NumPassageiro IN NUMBER) 	 
RETURN SYS_REFCURSOR 	 
IS 	 
	ccarona SYS_REFCURSOR;	 
BEGIN	 
	OPEN ccarona FOR
    	SELECT Cidade_saida, Estado_saida, DataSaida, Cidade_chegada, Estado_chegada, Numero_max_pessoas, Valor  
    	FROM Viagem v
		JOIN Ponto_Intermediario_Viagem piv ON v.ID_viagem = piv.ID_viagem
    	WHERE piv.Cidade IN (Cidade_saida, Cidade_chegada)
          	AND piv.Estado IN (Estado_saida, Estado_chegada)
        	AND v.Data_saida = DataSaida	 
        	AND v.Numero_max_pessoas >= NumPassageiro;	 
RETURN ccarona;	 
END; */


--Busca Carona 
CREATE PROCEDURE BuscarCarona
    @Cidade_saida NVARCHAR(100),
    @DataSaida DATE,
    @Cidade_chegada NVARCHAR(100),
    @NumPassageiro INT
AS
BEGIN
    SELECT 
        pis.cidade,  
        v.data_hora_saida,  
        v.numero_max_pessoas, 
        v.valor  
    FROM Viagem v
    JOIN ponto_intermediario_viagem piv ON v.ID_viagem = piv.ID_viagem
	JOIN pontos_intermediarios pis ON pis.CEP = piv.CEP_ponto
    WHERE pis.cidade IN (@Cidade_saida, @Cidade_chegada)
      AND v.data_hora_saida = @DataSaida
      AND v.Numero_max_pessoas >= @NumPassageiro;
END;
