--Exclusão lógica de veículo se não estiver associado a uma viagem futura
CREATE OR REPLACE PROCEDURE DeletaVeiculo(
    RENAVAM IN NUMBER)
IS
    cont NUMBER;
BEGIN
	SELECT COUNT(*) INTO cont /* Verificando se existe viagem futura associado ao veículo) */
    FROM Viagem v
	WHERE v.Renavam = RENAVAM 
    	AND v.Data_saida >= TRUNC(SYSDATE)
    	AND	v.Horario_saida > TO_CHAR(SYSDATE, 'HH24:MI:SS');

	IF cont > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Não é possivel excluir o veiculo pois está associado a futuras viagens');
    ELSE
    	UPDATE Carro c /* Excluindo carro */
       	SET c.Deletado = 'T'
		WHERE c.Renavam = RENAVAM;

        DBMS_OUTPUT.PUT_LINE('Carro excluido com sucesso');
		
	END IF;
END; 
/
