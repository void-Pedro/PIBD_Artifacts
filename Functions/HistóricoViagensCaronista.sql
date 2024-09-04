CREATE FUNCTION dbo.fn_CaronasOferecidasPorCaronista(@caronista_ID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT
        v.id_viagem,
        v.renavam,
        v.caronista_ID,
        v.valor,
        v.numero_max_pessoas
    FROM
        vw_CaronasOferecidas v
    WHERE
        v.caronista_ID = @caronista_ID
);
