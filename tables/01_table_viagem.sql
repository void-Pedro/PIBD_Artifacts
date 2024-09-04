-- Autor: Ana Ellen
-- DROP TABLE IF EXISTS Viagem CASCADE;

-- Criação da Tabela Viagem
CREATE TABLE IF NOT EXISTS Viagem (
	ID_viagem INT AUTO_INCREMENT,
	ID_caronista INT NOT NULL,
	Renavam INT NOT NULL,
	Valor DECIMAL(10, 2) NOT NULL,
	Data_hora_saida DATETIME NOT NULL,
	Data_hora_chegada_estimada DATETIME NOT NULL,
	Status_viagem status_viagem_enum NOT NULL,
	Numero_max_pessoas INT NOT NULL

	PRIMARY KEY(ID_viagem)
);