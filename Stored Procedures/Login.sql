CREATE PROCEDURE Acesso ( 
	@LoginUsuario varchar(100),
	@SenhaIn	varchar(100)
)
AS
BEGIN
	IF ((select count(*) from brasileiro where CPF = @LoginUsuario and Senha = @SenhaIn) = 0)
		PRINT 'Login ou Senha incorretos'
	IF ((select count(*) from estrangeiro where numero_passaporte = @LoginUsuario and Senha = @SenhaIn) = 0)
		PRINT 'Login ou Senha incorretos'
END
