-- Autor: Ana Ellen
CREATE PROCEDURE CadastrarViagem
	@ID_viagem INT AUTO_INCREMENT,
	@ID_caronista INT NOT NULL,
	@Renavam INT NOT NULL,
	@Valor DECIMAL(10, 2) NOT NULL,
	@Data_saida DATE NOT NULL,
	@Horario_saida TIME NOT NULL,
	@Data_chegada_estimada DATE NOT NULL,
	@Horario_chegada_estimada TIME NOT NULL,
	@Status_viagem status_viagem_enum NOT NULL,
	@Numero_max_pessoas INT NOT NULL
AS
BEGIN
    -- Verifica se o caronista já possui alguma carona dentro desse período de tempo (entre o horário de saída e o horário previsto de chegada + 15min)
    IF EXISTS (SELECT 1 FROM Viagem 
               WHERE ID_caronista = @ID_caronista 
			   AND )
    BEGIN
        PRINT 'Erro: ';
        RETURN;
    END

    -- Inserindo
    INSERT INTO Viagem (CEP, Rua, Numero, Complemento, Bairro, Cidade, Estado)
    VALUES (@CEP, @Rua, @Numero, @Complemento, @Bairro, @Cidade, @Estado);

    -- Mensagem de confirmação
    PRINT 'Viagem criada com sucesso.';
END;