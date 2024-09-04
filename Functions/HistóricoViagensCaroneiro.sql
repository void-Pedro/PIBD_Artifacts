CREATE FUNCTION dbo.fn_CaronasPegasPorCaroneiro(@caroneiro_ID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT
        s.caroneiro_ID,
        v.id_viagem,
        v.renavam,
        v.caronista_ID,
        v.valor,
        v.numero_max_pessoas,
        s.status
    FROM
        vw_CaronasPegas s
    WHERE
        s.caroneiro_ID = @caroneiro_ID
);
