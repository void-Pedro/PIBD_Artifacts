CREATE OR REPLACE VIEW Viagem_caroneiro AS
SELECT 
    v.ID_viagem,
    v.Data_hora_saida,
    v.Data_hora_chegada_estimada,
    v.Valor,

	u.nome_completo AS Nome_Caroneiro,
    pi.Rua,
    pi.Cidade,
    pi.Estado,
    c.Numero, -- por que o numero ta no contem?
    c.Inicio,
    c.Fim

FROM 
    Viagem v

-- todos os pontos intermediarios de uma viagem
LEFT JOIN 
    Contem c ON v.ID_viagem = c.ID_viagem

LEFT JOIN 
    Pontos_Intermediarios pi ON c.CEP = pi.CEP

LEFT JOIN 
    Solicita s ON c.CEP = s.CEP AND v.ID_viagem = s.ID_viagem

-- informaçao dos caroneiros de cada ponto
LEFT JOIN 
    caroneiro ce ON s.ID_caroneiro = ce.ID_caroneiro
LEFT JOIN 
    usuario_geral u ON ce.ID_caroneiro = u.ID

WHERE
	v.ID_viagem = @ID_viagem AND v.Status_viagem = "Em Andamento"

-- sugestao: averiguar o pontos intermediarios, ficaria mais simples se juntasse com o contem?