-- Autor: Ana Ellen
CREATE OR REPLACE VIEW vw_viagem AS
SELECT 
    v.ID_viagem,
    v.data_hora_saida,
    v.data_hora_chegada_estimada,
    v.valor,
    v.status_viagem,

    pi.logradouro,
    pi.estado,
    pi.cidade,
    pi.estado,

	c.numero,
    c.inicio,
    c.fim,

    u.nome_completo,

    ce.ID_caroneiro,
    ci.ID_caronista,

    car.placa,
    car.modelo,
    car.cor
FROM 
    viagem v
	
-- todos os pontos intermediarios de uma viagem
LEFT JOIN 
    pontos_intermediarios_viagem c ON v.ID_viagem = c.ID_viagem

LEFT JOIN 
    pontos_intermediarios pi ON c.CEP = pi.CEP

-- informaçao dos caroneiros de cada ponto
LEFT JOIN 
    solicita s ON c.CEP = s.CEP AND v.ID_viagem = s.ID_viagem
LEFT JOIN 
    caroneiro ce ON s.ID_caroneiro = ce.ID_caroneiro
LEFT JOIN 
    usuario_geral u ON ce.ID_caroneiro = u.ID

-- informacoes do carro e do caronista
INNER JOIN 
    dirige d ON v.ID_viagem = d.ID_viagem

INNER JOIN 
    carro car ON d.renavam = car.renavam

LEFT JOIN 
    usuario_geral u ON v.ID_caronista = u.ID