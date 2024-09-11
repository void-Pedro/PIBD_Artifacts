--Tabela Carro de um caronista usado em uma determinada viagem

CREATE TABLE IF NOT EXISTS caronista_carro (
	ID_caronista INT NOT NULL,
	renavam INT NOT NULL,
  ID_viagem INT NOT NULL

	PRIMARY KEY(ID_caronista, renavam),
	FOREIGN KEY(ID_caronista) REFERENCES caronista(ID_caronista),
	FOREIGN KEY(renavam) REFERENCES carro(renavam)
  FOREIGN KEY(ID_viagem) REFERENCES viagem(ID_viagem)
);
