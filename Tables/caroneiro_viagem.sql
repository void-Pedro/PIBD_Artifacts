--Tabela Caroneiro de uma determinada viagem

CREATE TABLE IF NOT EXISTS caroneiro_viagem (
	caroneiro_ID INT NOT NULL,
	id_viagem INT NOT NULL,
	nota_caronista FLOAT,
	nota_caroneiro FLOAT,

	PRIMARY KEY(caroneiro_ID, id_viagem),
	FOREIGN KEY(id_viagem) REFERENCES viagem(id_viagem),
	FOREIGN KEY(caroneiro_ID) REFERENCES caroneiro(caroneiro_ID)
);
