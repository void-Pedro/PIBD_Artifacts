--Tabela Brasileiro

CREATE TABLE IF NOT EXISTS brasileiro (
	ID_usuario INT IDENTITY (1,1) NOT NULL,
	CPF INT NOT NULL,
	Senha VARCHAR (50) NOT NULL,

	PRIMARY KEY(CPF),
	FOREIGN KEY(ID_usuario) REFERENCES usuario_geral(ID)
);
