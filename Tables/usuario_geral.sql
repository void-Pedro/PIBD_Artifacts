CREATE TABLE IF NOT EXISTS  usuario_geral  (
   ID  INT AUTO_INCREMENT,
   rede_social varchar(100),

   DDI  INT NOT NULL,
   DDD  INT NOT NULL,
   num_telefone  INT NOT NULL,

   nome  VARCHAR(100) NOT NULL,
   sobrenome  VARCHAR(100) NOT NULL,
   data_nascimento  VARCHAR(100) NOT NULL,
   sexo VARCHAR(100) NOT NULL,
   PRIMARY KEY ( ID )

) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
