-- Autor: Ana Ellen
ALTER TABLE Solicita_iagem 
	ADD CONSTRAINT FK_ID_viagem FOREIGN KEY(ID_viagem) REFERENCES Viagem(ID_viagem)