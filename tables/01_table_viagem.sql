-- Autor: Ana Ellen
-- DROP TABLE IF EXISTS Viagem CASCADE;

-- Criação da Tabela Viagem
CREATE TABLE IF NOT EXISTS Viagem (
	ID_viagem INT AUTO_INCREMENT,
	ID_caronista INT NOT NULL,
	Renavam INT NOT NULL,
	Valor DECIMAL(10, 2) NOT NULL,
	Horario_saida TIME NOT NULL,
	Data_saida DATE NOT NULL,
	Data_chegada_estimada DATE NOT NULL,
	Horario_chegada_estimada TIME NOT NULL,
	Status_viagem status_viagem_enum NOT NULL,
	Numero_max_pessoas INT NOT NULL,

	PRIMARY KEY(ID_viagem)
);