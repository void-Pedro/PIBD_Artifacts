--Tabela Brasileiro

CREATE TABLE IF NOT EXISTS brasileiro (
	ID_usuario INT NOT NULL,
	CPF VARCHAR (50) NOT NULL,
	Senha VARCHAR (50) NOT NULL,

	PRIMARY KEY(CPF),
	FOREIGN KEY(ID_usuario) REFERENCES usuario_geral(ID)
);
