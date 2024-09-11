--Tabela Caroneiro(pega carona)

CREATE TABLE IF NOT EXISTS caroneiro (
	caroneiro_ID INT NOT NULL,
	viagens_aceitas INT NOT NULL,

	PRIMARY KEY(caroneiro_ID),
	FOREIGN KEY(caroneiro_ID) REFERENCES usuario_geral(ID)
);
