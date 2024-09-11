--Tabela de pontos associados a uma viagem

CREATE TABLE IF NOT EXISTS ponto_intermediario_viagem(
	ID_viagem INT NOT NULL,

	CEP_ponto INT NOT NULL,
	Numero_ponto INT NOT NULL,
  Bairro  VARCHAR(100) NOT NULL,
  Cidade  VARCHAR(100) NOT NULL,
  Estado VARCHAR(100) NOT NULL,

	Data_hora_chegada DATETIME NOT NULL,
  Data_hora_saida DATETIME NOT NULL,

	PRIMARY KEY(ID_viagem, cep_ponto, numero_ponto),
	FOREIGN KEY(ID_viagem) REFERENCES viagem(ID_viagem),
	FOREIGN KEY(Cep_ponto, Numero_ponto) REFERENCES pontos_intermediarios(CEP, Numero)
);
