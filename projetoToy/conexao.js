const mysql = require('mysql');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'brinquedoteca'
});

connection.connect((err) => {
    if (err) {
        console.error('Erro ao conectar ao banco de dados:', err);
        return;
    }
    console.log('Conexão bem-sucedida ao banco de dados');
});

connection.query('SELECT * FROM Brinquedo', (err, results) => {
    if (err) {
        console.error('Erro ao executar consulta:', err);
        return;
    }
    console.log('Resultados da consulta:', results);
});
