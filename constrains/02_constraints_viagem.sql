-- Autor: Ana Ellen
ALTER TABLE Viagem 
	ADD CONSTRAINT FK_Caronista_carro FOREIGN KEY(Renavam) 
	REFERENCES Caronista_carro(Renavam);

ALTER TABLE Viagem 
	ADD CONSTRAINT FK_ID_caronista FOREIGN KEY(ID_caronista) 
	REFERENCES Caronista_carro(ID_caronista);