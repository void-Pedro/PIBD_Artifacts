CREATE OR REPLACE VIEW vw_viagem AS
SELECT 
    v.ID_viagem,
    v.Data_hora_saida,
    v.Data_hora_chegada_estimada,
    v.Valor,
    v.Status_viagem,

    pi.Logradouro,
    pi.Estado,
    pi.Cidade,
    pi.Estado,

	c.Numero,
    c.Inicio,
    c.Fim,

    u.Nome_completo,

    ce.ID_caroneiro,
    ci.ID_caronista,

    car.Placa,
    car.Modelo,
    car.Cor
FROM 
    Viagem v
	
-- todos os pontos intermediarios de uma viagem
LEFT JOIN 
    Pontos_Intermediarios_Viagem c ON v.ID_viagem = c.ID_viagem

LEFT JOIN 
    Pontos_Intermediarios pi ON c.CEP = pi.CEP

-- informaçao dos caroneiros de cada ponto
LEFT JOIN 
    Solicita s ON c.CEP = s.CEP AND v.ID_viagem = s.ID_viagem
LEFT JOIN 
    caroneiro ce ON s.ID_caroneiro = ce.ID_caroneiro
LEFT JOIN 
    usuario_geral u ON ce.ID_caroneiro = u.ID

-- informacoes do carro e do caronista
INNER JOIN 
    Dirige d ON v.ID_viagem = d.ID_viagem

INNER JOIN 
    Carro car ON d.Renavam = car.Renavam

LEFT JOIN 
    usuario_geral u ON v.ID_caronista = u.ID