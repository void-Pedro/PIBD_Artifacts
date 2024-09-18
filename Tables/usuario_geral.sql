CREATE TABLE IF NOT EXISTS  usuario_geral  (
   ID  INT AUTO_INCREMENT,
   rede_social varchar(100),

   DDI  INT,
   DDD  INT,
   num_telefone  INT,

   nome  VARCHAR(100),
   sobrenome  VARCHAR(100),
   data_nascimento  VARCHAR(100),
   sexo VARCHAR(100),
   cadastro_stat VARCHAR(50) NOT NULL,
   PRIMARY KEY ( ID )

) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
