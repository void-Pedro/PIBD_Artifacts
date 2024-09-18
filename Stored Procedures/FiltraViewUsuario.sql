--Filtro para view de UsuárioCarona
--Mostra os usuários de uma determinada carona

CREATE PROCEDURE FiltraViewUsuario(
    @ID_viagem INT)
AS
BEGIN
    SELECT * FROM UsuarioCarona
    WHERE ID_viagem = @ID_viagem;
END;
