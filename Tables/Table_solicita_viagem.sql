-- Autor: Ana Ellen
-- DROP TABLE IF EXISTS Solicita_viagem CASCADE;

-- Criação da Tabela Solicita_viagem
CREATE TABLE IF NOT EXISTS Solicita_viagem(
	ID_caroneiro INT NOT NULL,
	ID_viagem INT NOT NULL

	PRIMARY KEY(ID_caroneiro, ID_viagem)
);