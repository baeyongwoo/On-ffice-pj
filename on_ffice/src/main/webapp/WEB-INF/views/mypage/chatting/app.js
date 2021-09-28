const express = require('express');

const socket = require('socket.io');

const http = require('http');

const app = express();

const server = http.createServer(app);

const io = socket(server);

app.get('/', function (request, response) {

    console.log('유저가 / 에서 접속하였습니다.');
    response.send('노드서버에 접속중입니다')

})

server.listen(8080, function () {
    console.log("노드 서버 실행중...")
});