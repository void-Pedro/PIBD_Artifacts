CREATE DATABASE SistemaCaronas;
GO
USE SistemaCaronas;
GO

CREATE TABLE usuario_geral (
   ID INT IDENTITY(1,1),
   rede_social VARCHAR(100),

   DDI INT NOT NULL,
   DDD INT NOT NULL,
   num_telefone INT NOT NULL,

   nome VARCHAR(100) NOT NULL,
   sobrenome VARCHAR(100) NOT NULL,
   data_nascimento VARCHAR(100) NOT NULL,
   sexo VARCHAR(100) NOT NULL,
   PRIMARY KEY (ID)
);
GO

CREATE TABLE estrangeiro (
   ID_usuario INT NOT NULL,
   validade_passaporte VARCHAR(50) NOT NULL,
   numero_passaporte VARCHAR(50) NOT NULL,

   PRIMARY KEY (numero_passaporte),
   FOREIGN KEY (ID_usuario) REFERENCES usuario_geral(ID)
);
GO

CREATE TABLE brasileiro (
   ID_usuario INT NOT NULL,
   CPF INT NOT NULL,

   PRIMARY KEY (CPF),
   FOREIGN KEY (ID_usuario) REFERENCES usuario_geral(ID)
);
GO

CREATE TABLE caronista (
   caronista_ID INT NOT NULL,
   numero_cnh INT NOT NULL,
   data_validade_cnh VARCHAR(50) NOT NULL,
   viagens_feitas INT NOT NULL,
   quantidade_avaliacoes INT NOT NULL,

   PRIMARY KEY (caronista_ID),
   FOREIGN KEY (caronista_ID) REFERENCES usuario_geral(ID)
);
GO

CREATE TABLE carro (
   renavam INT PRIMARY KEY NOT NULL,
   placa VARCHAR(7) NOT NULL,
   model VARCHAR(50) NOT NULL,
   cor VARCHAR(30) NOT NULL,
   ano INT NOT NULL
);
GO

CREATE TABLE caronista_carro (
   ID_caronista INT NOT NULL,
   renavam INT NOT NULL,

   PRIMARY KEY (ID_caronista, renavam),
   FOREIGN KEY (ID_caronista) REFERENCES caronista(caronista_ID),
   FOREIGN KEY (renavam) REFERENCES carro(renavam)
);
GO

CREATE TABLE caroneiro (
   caroneiro_ID INT NOT NULL,
   viagens_aceitas INT NOT NULL,

   PRIMARY KEY (caroneiro_ID),
   FOREIGN KEY (caroneiro_ID) REFERENCES usuario_geral(ID)
);
GO

CREATE TABLE viagem (
   ID_viagem INT IDENTITY(1,1),
   ID_caronista INT NOT NULL,
   renavam INT NOT NULL,
   valor DECIMAL(10, 2) NOT NULL,
   data_hora_saida DATETIME NOT NULL,
   data_hora_chegada_estimada DATETIME NOT NULL,
   status_viagem VARCHAR(50) NOT NULL,
   numero_max_pessoas INT NOT NULL,

   PRIMARY KEY (ID_viagem),
   FOREIGN KEY (ID_caronista, renavam) REFERENCES caronista_carro(ID_caronista, renavam)
);
GO

CREATE TABLE caroneiro_viagem (
   caroneiro_ID INT NOT NULL,
   ID_viagem INT NOT NULL,
   nota_caronista FLOAT,
   nota_caroneiro FLOAT,

   PRIMARY KEY (caroneiro_ID, ID_viagem),
   FOREIGN KEY (ID_viagem) REFERENCES viagem(ID_viagem),
   FOREIGN KEY (caroneiro_ID) REFERENCES caroneiro(caroneiro_ID)
);
GO

CREATE TABLE pontos_intermediarios (
   CEP INT NOT NULL,
   rua VARCHAR(100) NOT NULL,
   numero INT NOT NULL,
   bairro VARCHAR(100) NOT NULL,
   cidade VARCHAR(100) NOT NULL,
   estado VARCHAR(100) NOT NULL,

   PRIMARY KEY (CEP, numero)
);
GO

CREATE TABLE ponto_intermediario_viagem (
   ID_viagem INT NOT NULL,
   CEP_ponto INT NOT NULL,
   numero_ponto INT NOT NULL,
   data_hora_chegada DATETIME NOT NULL,
   data_hora_saida DATETIME NOT NULL,

   PRIMARY KEY (ID_viagem, CEP_ponto, numero_ponto),
   FOREIGN KEY (ID_viagem) REFERENCES viagem(ID_viagem),
   FOREIGN KEY (CEP_ponto, numero_ponto) REFERENCES pontos_intermediarios(CEP, numero)
);
GO

CREATE TABLE solicita_viagem (
   ID_caroneiro INT NOT NULL,
   ID_viagem INT NOT NULL,
   status BIT NOT NULL,

   PRIMARY KEY (ID_caroneiro, ID_viagem),
   FOREIGN KEY (ID_caroneiro) REFERENCES caroneiro(caroneiro_ID),
   FOREIGN KEY (ID_viagem) REFERENCES viagem(ID_viagem)
   
);
GO

CREATE TABLE avaliacao (
	ID_caroneiro INT NOT NULL,
	ID_viagem INT NOT NULL,
	nota INT NOT NULL,
	comentario VARCHAR(200),

	PRIMARY KEY(ID_caroneiro, ID_viagem),
	FOREIGN KEY (ID_caroneiro) REFERENCES caroneiro(caroneiro_ID),
    FOREIGN KEY (ID_viagem) REFERENCES viagem(ID_viagem)
);
