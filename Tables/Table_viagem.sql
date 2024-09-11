-- Autor: Ana Ellen
-- DROP TABLE IF EXISTS viagem CASCADE;

-- Criação da Tabela Viagem
CREATE TABLE IF NOT EXISTS viagem (
	ID_viagem INT AUTO_INCREMENT,
	ID_caronista INT NOT NULL,
	renavam INT NOT NULL,
	valor DECIMAL(10, 2) NOT NULL,
	data_hora_saida DATETIME NOT NULL,
	data_hora_chegada_estimada DATETIME NOT NULL,
	status_viagem status_viagem_enum NOT NULL,
	numero_max_pessoas INT NOT NULL

	PRIMARY KEY(ID_viagem)
);