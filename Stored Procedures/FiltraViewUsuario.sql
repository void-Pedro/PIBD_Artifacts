--Filtro para view de UsuárioCarona
--Mostra os usuários de uma determinada carona

CREATE OR REPLACE PROCEDURE FiltraViewUsuario(
    ID_viagem IN NUMBER,
    cview OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN cview FOR
    SELECT * FROM UsuarioCarona
    WHERE ID_viagem = ID_viagem;
END;
/
