CREATE VIEW vw_CaronasPegas AS
SELECT
    s.ID_caroneiro,
    v.ID_viagem,
    v.renavam,
    v.ID_caronista,
    v.valor,
    v.numero_max_pessoas,
    s.status
FROM
    solicita_viagem s
INNER JOIN
    viagem v ON s.ID_viagem = v.ID_viagem
WHERE
    s.status = TRUE;
