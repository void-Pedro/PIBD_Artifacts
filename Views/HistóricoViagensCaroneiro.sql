CREATE VIEW vw_CaronasPegas AS
SELECT
    s.caroneiro_ID,
    v.id_viagem,
    v.renavam,
    v.caronista_ID,
    v.valor,
    v.numero_max_pessoas,
    s.status
FROM
    solicita_viagem s
INNER JOIN
    viagem v ON s.id_viagem = v.id_viagem
WHERE
    s.status = TRUE;
