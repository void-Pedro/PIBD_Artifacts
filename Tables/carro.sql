--Tabela Carro

CREATE TABLE IF NOT EXISTS carro (
	renavam INT PRIMARY KEY NOT NULL,
	placa VARCHAR(7) NOT NULL,
	model VARCHAR(50) NOT NULL,
	cor VARCHAR(30) NOT NULL,
	ano INT NOT NULL
);
