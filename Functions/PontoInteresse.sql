--Ponto de interesse de um usuário associado a uma viagem 
CREATE OR REPLACE FUNCTION Ponto_Interesse( 
   @user_id INT)
RETURNS TABLE
AS
RETURN(
    SELECT 
        pis.CEP,
        pis.rua,
        pis.numero,
        pis.bairro,
        pis.cidade,
        pis.estado
    FROM pontos_intermediarios pis
	JOIN ponto_intermediario_viagem piv ON piv.CEP_ponto = pis.CEP
	JOIN caroneiro_viagem cv ON cv.ID_viagem = piv.ID_viagem
	WHERE cv.caroneiro_ID = @user_id
);
