CREATE OR REPLACE VIEW vw_carrosAtivos AS
SELECT
	car.Renavam,
	car.Placa,
	car.Modelo,
	car.Cor
FROM
	Carro car
JOIN
	cadastra_carros s ON car.renavam = s.renavam;
