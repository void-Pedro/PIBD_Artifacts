-- Autor: Ana Ellen
CREATE OR REPLACE VIEW Perfil_usuario AS
SELECT 
	u.nome_completo, u.sexo, 
	ce.quantidade_avaliacoes_caroneiro, ce.nota_media_caroneiro
FROM 
	user u
JOIN
    caroneiro ce ON u.id = ce.ID_caroneiro;