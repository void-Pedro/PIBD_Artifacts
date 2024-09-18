CREATE PROCEDURE CadastraBrasileiro(
    @CPFIn VARCHAR(50),
	@SenhaIn VARCHAR(50)
)
AS
BEGIN
	IF (dbo.CPF_VALIDO(@CPFIn) = 0)
	BEGIN
		PRINT 'CPF inválido'
	END
	IF (dbo.CPF_VALIDO(@CPFIn) = 1)
	BEGIN
		Declare @existe as int = (select count(*) from brasileiro where CPF = @CPFIn)
		IF (@existe = 1)
		BEGIN
			PRINT 'CPF já cadastrado'
		END
		IF @existe = 0
		BEGIN
			insert into dbo.usuario_geral(cadastro_stat)
			values ('andamento')
			insert into dbo.brasileiro(ID_usuario, CPF, senha)
			values (ident_current('usuario_geral'), @CPFIn, @SenhaIn)
		END
	END
END 
