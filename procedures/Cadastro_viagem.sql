-- Autor: Ana Ellen
CREATE PROCEDURE CadastrarViagem
	@ID_viagem INT AUTO_INCREMENT,
	@ID_caronista INT NOT NULL,
	@Renavam INT NOT NULL,
	@Valor DECIMAL(10, 2) NOT NULL,
	@Data_hora_saida DATETIME NOT NULL,
	@Data_hora_chegada_estimada DATETIME NOT NULL,
	@Status_viagem status_viagem_enum NOT NULL,
	@Numero_max_pessoas INT NOT NULL
AS
BEGIN
    -- Verifica se o caronista já possui alguma carona que entre em conflito com esta
    IF EXISTS (SELECT 1 FROM Viagem 
               WHERE ID_caronista = @ID_caronista
               AND(
                    @Data_hora_saida BETWEEN Data_hora_saida AND Data_hora_chegada_estimada
                    OR
                    @Data_hora_chegada_estimada BETWEEN Data_hora_saida AND Data_hora_chegada_estimada
                    OR
                    (Data_hora_saida BETWEEN @Data_hora_saida AND @Data_hora_chegada_estimada)
                    OR
                    (Data_hora_chegada_estimada BETWEEN @Data_hora_saida AND @Data_hora_chegada_estimada)
                ))
    BEGIN
        PRINT 'Erro: Viagem entra em conflito com outra viagem já existente';
        RETURN;
    END

    -- Inserindo
    INSERT INTO Viagem (ID_caronista, Renavam, Valor, Data_hora_saida, Data_hora_chegada_estimada, Status_viagem, Numero_max_pessoas)
    VALUES (@ID_caronista, @Renavam, @Valor, @Data_hora_saida, @Data_hora_chegada_estimada, @Status_viagem, @Numero_max_pessoas);


    -- Mensagem de confirmação
    PRINT 'Viagem criada com sucesso.';
END;