CREATE OR REPLACE VIEW Viagem_caroneiro AS
SELECT 
    v.ID_viagem,
    v.Data_hora_saida,
    v.Data_hora_chegada_estimada,
    v.Valor,

    pi.Logradouro,
    pi.Estado,
    pi.Cidade,
    pi.Estado,
	c.Numero,
    c.Inicio,
    c.Fim,

    u.nome_completo AS Nome_Caronista,
    car.Placa,
    car.Modelo,
    car.Cor

FROM 
    Viagem v
	
-- pontos do caroneiro especifico
INNER JOIN 
    Contem c ON v.ID_viagem = c.ID_viagem

INNER JOIN 
    pontos_intermediarios pi ON c.CEP = pi.CEP

-- informacoes do carro e do caronista
INNER JOIN 
    Dirige d ON v.ID_viagem = d.ID_viagem

INNER JOIN 
    Carro car ON d.Renavam = car.Renavam

LEFT JOIN 
    usuario_geral u ON v.ID_caronista = u.ID
	
WHERE 
    s.ID_caroneiro = @ID_caroneiro AND v.Status_viagem = "Em Andamento"
