CREATE VIEW vw_CaronasOferecidas AS
SELECT
    v.id_viagem,
    v.renavam,
    v.caronista_ID,
    v.valor,
    v.numero_max_pessoas
FROM
    viagem v
INNER JOIN
    solicita_viagem s ON v.id_viagem = s.id_viagem
WHERE
    s.status = TRUE
GROUP BY
    v.id_viagem
HAVING
    COUNT(s.caroneiro_ID) > 0;
