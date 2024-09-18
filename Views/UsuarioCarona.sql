--View de pessoas que estão em uma carona

CREATE VIEW UsuarioCarona AS
	SELECT 
		v.ID_viagem, 
		ug.nome_completo,
		cv.nota_caronista, 
		cv.nota_caroneiro
	FROM Viagem v, caroneiro_viagem cv, usuario_geral ug
	WHERE cv.ID_viagem = v.ID_viagem
		AND ug.ID = cv.caroneiro_ID;
