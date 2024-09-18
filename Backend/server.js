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

// Inicializa o servidor na porta 3000
app.listen(3000, () => {
    console.log('Servidor rodando na porta 3000.');
});
