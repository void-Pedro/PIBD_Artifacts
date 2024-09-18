const express = require('express');
const { Connection, Request} = require('tedious'); // Importar TYPES
var TYPES = require('tedious').TYPES;

// Configurações da conexão com SQL Server
const config = {
    server: 'localhost\\SQLEXPRESS',  // Atualize com o nome do servidor
    authentication: {
        type: 'default',
        options: {
            userName: 'teste',  // Atualize com seu usuário
            password: '123'    // Atualize com sua senha
        }
    },
    options: {
        encrypt: true,
        trustServerCertificate: true,
        database: 'SistemaCaronas'  // Atualize com o nome do banco de dados
    }
};

// Cria uma instância do Express
const app = express();
app.use(express.json()); // Para lidar com JSON no body

// Função para criar uma conexão com o banco de dados
function createConnection() {
    return new Connection(config);
}

// Conectar ao banco de dados e criar a rota POST
app.post('/carros', (req, res) => {
    const { renavam, placa, model, cor, ano } = req.body;
    const connection = createConnection();

    connection.on('connect', err => {
        if (err) {
            console.error('Erro ao conectar ao SQL Server:', err);
            res.status(500).send('Erro ao conectar ao SQL Server');
            return;
        }
        console.log('Conectado ao SQL Server.');

        const query = `
            INSERT INTO carro (renavam, placa, model, cor, ano) 
            VALUES (@renavam, @placa, @model, @cor, @ano)
        `;

        const request = new Request(query, (err, rowCount) => {
            if (err) {
                console.error('Erro ao executar a query:', err);
                res.status(500).send('Erro ao inserir carro: ' + err.message);
            } else {
                res.send('Carro inserido com sucesso.');
            }
            connection.close();
        });

        request.addParameter('renavam', TYPES.Int, renavam);
        request.addParameter('placa', TYPES.VarChar, placa);
        request.addParameter('model', TYPES.VarChar, model);
        request.addParameter('cor', TYPES.VarChar, cor);
        request.addParameter('ano', TYPES.Int, ano);

        connection.execSql(request);
    });

    connection.connect();
});



// Rota para obter informações de viagens em andamento
app.get('/AcompanharCarona', async (req, res) => {
    try {
      const result = await pool.request().query(`
        SELECT
          ID_viagem,
          valor,
          data_hora_saida AS start_time,
          data_hora_chegada_estimada AS end_time,
          status_viagem AS status,
          car_model,
          license_plate,
          driver_name,
          car_color
        FROM vw_viagem
      `);
      res.json(result.recordset);
    } catch (err) {
      console.error('Erro ao buscar dados:', err);
      res.status(500).send('Erro ao buscar dados');
    }
  });

  app.post('/acompanhar-carona', (req, res) => {
    const { caronista_ID } = req.body;
    const connection = createConnection();

    connection.on('connect', err => {
        if (err) {
            console.error('Erro ao conectar ao SQL Server:', err);
            res.status(500).send('Erro ao conectar ao SQL Server');
            return;
        }
        console.log('Conectado ao SQL Server.');

        const request = new Request('AcompanharCarona', (err, rowCount, rows) => {
            if (err) {
                console.error('Erro ao executar a procedure:', err);
                res.status(500).send('Erro ao buscar caronas: ' + err.message);
            } else {
                const caronas = [];
                rows.forEach(row => {
                    const carona = {};
                    row.forEach(column => {
                        carona[column.metadata.colName] = column.value;
                    });
                    caronas.push(carona);
                });
                res.json(caronas);
            }
            connection.close();
        });

        request.addParameter('caronista_ID', TYPES.VarChar, caronista_ID);

        request.setSql('EXEC GetViagemCaronista @caronista_ID');
        connection.execSql(request);
    });

    connection.connect();
});


app.post('/ofertar-caronas', (req, res) => {
    const {
        ID_caronista, Renavam, Valor, Data_hora_saida, Data_hora_chegada_estimada, Status_viagem, Numero_max_pessoas,
        pontos_intermediarios
    } = req.body;

    const connection = createConnection();

    connection.on('connect', err => {
        if (err) {
            console.error('Erro ao conectar ao SQL Server:', err);
            res.status(500).send('Erro ao conectar ao SQL Server');
            return;
        }
        console.log('Conectado ao SQL Server.');

        const request = new Request('OfertarCaronas', (err, rowCount, rows) => {
            if (err) {
                console.error('Erro ao cadastrar a viagem:', err);
                res.status(500).send('Erro ao cadastrar viagem: ' + err.message);
            } else {
                const viagemId = rows[0].ID_viagem;

                pontos_intermediarios.forEach(ponto => {
                    const { CEP, rua, numero, data_chegada, horario_chegada, horario_saida } = ponto;

                    const pontoRequest = new Request('InserirPontoIntermediarioExistente', (err, rowCount, rows) => {
                        if (err) {
                            console.error('Erro ao inserir ponto intermediário:', err);
                            res.status(500).send('Erro ao inserir ponto intermediário: ' + err.message);
                            return;
                        }
                        console.log('Ponto intermediário inserido com sucesso.');
                    });

                    pontoRequest.addParameter('p_id_viagem', TYPES.Int, viagemId);
                    pontoRequest.addParameter('p_CEP', TYPES.Int, CEP);
                    pontoRequest.addParameter('p_rua', TYPES.Int, rua);
                    pontoRequest.addParameter('p_numero', TYPES.Int, numero);
                    pontoRequest.addParameter('p_data_chegada', TYPES.Date, new Date(data_chegada));
                    pontoRequest.addParameter('p_horario_chegada', TYPES.Time, horario_chegada);
                    pontoRequest.addParameter('p_horario_saida', TYPES.Time, horario_saida);

                    connection.execSql(pontoRequest);
                });

                res.json({ message: 'Viagem e pontos intermediários cadastrados com sucesso.' });
            }

            connection.close();
        });

        request.addParameter('ID_caronista', TYPES.Int, ID_caronista);
        request.addParameter('Renavam', TYPES.Int, Renavam);
        request.addParameter('Valor', TYPES.Decimal, Valor);
        request.addParameter('Data_hora_saida', TYPES.DateTime, new Date(Data_hora_saida));
        request.addParameter('Data_hora_chegada_estimada', TYPES.DateTime, new Date(Data_hora_chegada_estimada));
        request.addParameter('Status_viagem', TYPES.VarChar, Status_viagem);
        request.addParameter('Numero_max_pessoas', TYPES.Int, Numero_max_pessoas);

        request.setSql('EXEC CadastrarViagem @ID_caronista, @Renavam, @Valor, @Data_hora_saida, @Data_hora_chegada_estimada, @Status_viagem, @Numero_max_pessoas');
        connection.execSql(request);
    });

    connection.connect();
});

//Rota para buscar caronas disponíveis
app.post('/buscar-caronas', (req, res) => {
    const { Cidade_saida, DataSaida, Cidade_chegada, NumPassageiro } = req.body;
    const connection = createConnection();

    connection.on('connect', err => {
        if (err) {
            console.error('Erro ao conectar ao SQL Server:', err);
            res.status(500).send('Erro ao conectar ao SQL Server');
            return;
        }
        console.log('Conectado ao SQL Server.');

        const request = new Request('BuscarCarona', (err, rowCount, rows) => {
            if (err) {
                console.error('Erro ao executar a procedure:', err);
                res.status(500).send('Erro ao buscar caronas: ' + err.message);
            } else {
                const caronas = [];
                rows.forEach(row => {
                    const carona = {};
                    row.forEach(column => {
                        carona[column.metadata.colName] = column.value;
                    });
                    caronas.push(carona);
                });
                res.json(caronas);
            }
            connection.close();
        });
        
        request.addParameter('Cidade_saida', TYPES.VarChar, Cidade_saida);
        request.addParameter('DataSaida', TYPES.Date, DataSaida);
        request.addParameter('Cidade_chegada', TYPES.VarChar, Cidade_chegada);
        request.addParameter('NumPassageiro', TYPES.Int, NumPassageiro);

        request.setSql('EXEC BuscarCarona @Cidade_saida, @DataSaida, @Cidade_chegada, @NumPassageiro');
        connection.execSql(request);
    });

    connection.connect();
});


// Inicializa o servidor na porta 3000
app.listen(3000, () => {
    console.log('Servidor rodando na porta 3000.');
});
