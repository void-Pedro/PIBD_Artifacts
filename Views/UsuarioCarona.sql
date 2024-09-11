--View de pessoas que estão em uma carona

CREATE OR REPLACE VIEW UsuarioCarona AS
	SELECT v.ID_viagem, Nome, Nota_caronista, Nota_caroneiro
	FROM Viagem v, Caroneiro_viagem cv, usuario_geral ug
	WHERE cv.ID_viagem = v.ID_viagem
		AND ug.ID = cv.ID_caroneiro;
