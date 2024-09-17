CREATE OR REPLACE VIEW vw_pontosIntermediarios AS
SELECT
p_id_viagem,
p_CEP,
p_Rua,
p_Numero,
p_Bairro,
p_Cidade,
p_Estado,
p_Data_chegada,
p_Horario_chegada,
p_Horario_saida
FROM
	Pontos_intermediarios p
JOIN
	cadastra_pontos_intermediarios s ON p.CEP = s.CEP
