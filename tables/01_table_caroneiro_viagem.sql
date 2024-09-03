-- Autor: Ana Ellen
-- DROP TABLE IF EXISTS Caroneiro_viagem CASCADE;

-- Criação da Tabela Caroneiro_viagem
CREATE TABLE IF NOT EXISTS Caroneiro_viagem (
	ID_caroneiro INT NOT NULL,
	ID_viagem INT NOT NULL,
	Nota_caronista FLOAT,
	Nota_caroneiro FLOAT,

	PRIMARY KEY(ID_caroneiro, ID_viagem)
);