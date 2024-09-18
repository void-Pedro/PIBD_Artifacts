CREATE PROCEDURE Cadastra_Usuario(
	@NomeCompletoIn VARCHAR (100),
	@DataNascimentoIn VARCHAR (100),
	@DDIIn INT,
	@DDDIn INT,
	@NumeroTelefoneIn VARCHAR(100),
	@SexoPessoa VARCHAR(100),
	@RedeSocial VARCHAR(100)
)
AS
BEGIN
	insert into dbo.usuario_geral (nome_completo, data_nascimento, DDI, DDD, num_telefone, sexo, rede_social, cadastro_stat)
	Values (@NomeCompletoIn, @DataNascimentoIn, @DDIIn, @DDDIn, @NumeroTelefoneIn, @SexoPessoa, @RedeSocial, 'completo')
END
