CREATE TABLE ponto_viagem (
   ID_viagem INT NOT NULL,
   CEP_ponto INT NOT NULL,
   numero_ponto INT NOT NULL,
   data_hora_chegada DATETIME NOT NULL,
   data_hora_saida DATETIME NOT NULL,
   cidade_chegada NVARCHAR(100),

   PRIMARY KEY (ID_viagem, CEP_ponto, numero_ponto),
   FOREIGN KEY (ID_viagem) REFERENCES viagem(ID_viagem),
   FOREIGN KEY (CEP_ponto, numero_ponto) REFERENCES pontos_intermediarios(CEP, numero)
);
GO
