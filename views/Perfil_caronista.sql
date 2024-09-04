-- Autor: Ana Ellen
CREATE OR REPLACE VIEW Perfil_usuario AS
SELECT 
	u.nome_completo, u.sexo, 
	ce.quantidade_avaliacoes_caroneiro, ce.nota_media_caroneiro, 
	ci.quantidade_avaliacoes_caronista, ci.nota_media_caronista
FROM 
	user u
JOIN
	caronista ci ON u.id = ci.ID_caronista
JOIN
    caroneiro ce ON u.id = ce.ID_caroneiro;