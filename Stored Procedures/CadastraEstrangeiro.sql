CREATE PROCEDURE CadastraEstrangeiro(
	@NumeroPassaporteIn VARCHAR(50),
	@ValidadePassaporteIn VARCHAR(100),
	@SenhaIn VARCHAR(50)
)
AS
BEGIN
	IF (convert(varchar, @ValidadePassaporteIn, 103) < GETDATE())
	BEGIN
		PRINT 'Passaporte Invalido'
	END
	IF (convert(varchar, @ValidadePassaporteIn, 103) > GETDATE())
	BEGIN
		Declare @existe as int = (select count(*) from estrangeiro where numero_passaporte = @NumeroPassaporteIn)
		IF (@existe = 1)
		BEGIN
			PRINT 'Passaporte já cadastrado'
		END
		IF @existe = 0
		BEGIN
			insert into dbo.usuario_geral(cadastro_stat)
			values ('andamento')
			insert into dbo.estrangeiro(ID_usuario, numero_passaporte, validade_passaporte, senha)
			values (ident_current('usuario_geral'), @NumeroPassaporteIn, @ValidadePassaporteIn, @SenhaIn)
		END
	END
END
