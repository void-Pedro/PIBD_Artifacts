--View de participantes de uma carona
CREATE OR REPLACE VIEW UsuarioCarona AS
	SELECT ID_caronista, ID_caroneiro, Nota_caronista, Nota_caroneiro
	FROM Viagem v, Caroneiro_viagem cv
	WHERE cv.ID_viagem = v.ID_viagem
