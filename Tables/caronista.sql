--Tabela Caronista(oferce carona)

CREATE TABLE IF NOT EXISTS caronista (
	caronista_ID INT NOT NULL,
	numero_cnh INT NOT NULL,
	data_validade_cnh VARCHAR(50) NOT NULL,
	viagens_feitas INT NOT NULL,
	quantidade_avaliacoes INT NOT NULL,

	PRIMARY KEY(caronista_ID, numero_cnh),
	FOREIGN KEY(caronista_ID) REFERENCES usuario_geral(ID)
);
