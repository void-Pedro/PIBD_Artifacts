--Tabela Estrangeiro

CREATE TABLE IF NOT EXISTS estrangeiro (
	ID_usuario INT IDENTITY (1,1) NOT NULL,
	validade_passaporte VARCHAR(50) NOT NULL,
	numero_passaporte VARCHAR(50) NOT NULL,
	Senha VARCHAR(50) NOT NULL,

	PRIMARY KEY(numero_passaporte),
	FOREIGN KEY(ID_usuario) REFERENCES usuario_geral(ID)
);
