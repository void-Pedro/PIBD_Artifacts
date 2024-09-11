--Tabela Brasileiro

CREATE TABLE IF NOT EXISTS brasileiro (
	ID_usuario INT NOT NULL,
	CPF INT NOT NULL,

	PRIMARY KEY(CPF),
	FOREIGN KEY(ID_usuario) REFERENCES usuario_geral(ID)
);
