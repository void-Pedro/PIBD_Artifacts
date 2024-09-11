--Tabela de pontos intermediários

CREATE TABLE IF NOT EXISTS pontos_intermediarios (
   CEP  INT NOT NULL,
   rua VARCHAR(100) NOT NULL,
   número INT NOT NULL,
   bairro  VARCHAR(100) NOT NULL,
   cidade  VARCHAR(100) NOT NULL,
   estado VARCHAR(100) NOT NULL,

   PRIMARY KEY (CEP)
);
