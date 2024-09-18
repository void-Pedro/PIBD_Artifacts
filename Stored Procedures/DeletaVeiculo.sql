/*
CREATE TABLE IF NOT EXISTS carro (
	Renavam INT PRIMARY KEY NOT NULL,
	Placa VARCHAR(7) NOT NULL,
	Modelo VARCHAR(50) NOT NULL,
	Cor VARCHAR(30) NOT NULL,
	Ano INT NOT NULL,
	Deletado BOOL NOT NULL
);
*/

-Exclusão lógica de veículo se não estiver associado a uma viagem futura

CREATE PROCEDURE DeletaVeiculo(
    @RENAVAM INT)
AS
BEGIN
	DECLARE @cont INT;

	SELECT @cont = COUNT(*) /* Verificando se existe viagem futura associado ao veículo) */
    FROM Viagem v
	WHERE v.Renavam = @RENAVAM 
    	AND v.data_hora_chegada_estimada >= GETDATE();

	IF @cont > 0 
		BEGIN
			RAISERROR('Não é possivel excluir o veiculo pois está associado a futuras viagens', 16, 1);
		END
    ELSE
		BEGIN
    	UPDATE Carro /* Excluindo carro */
       		SET deletado = 1
			WHERE Renavam = @RENAVAM;

			PRINT('Carro excluido com sucesso');	
	END 
END; 
