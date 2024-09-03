-- Autor: Ana Ellen
ALTER TABLE Caroneiro_viagem 
	ADD CONSTRAINT FK_ID_caronista 
	FOREIGN KEY(ID_viagem) REFERENCES Viagem(ID_viagem);

ALTER TABLE Caroneiro_viagem 
	ADD CONSTRAINT FK_ID_caronista 
	FOREIGN KEY(ID_caroneiro) REFERENCES Caroneiro(ID_caroneiro)