const http = require("http");

// Porta em que o servidor irá escutar
const PORT = 3000;

// Função que lida com as requisições
const requestHandler = (req, res) => {
  const { url, method } = req;

  // Configuração do cabeçalho de resposta
  res.setHeader("Content-Type", "application/json");

  if (url === "/" && method === "GET") {
    res.statusCode = 200;
    res.end(JSON.stringify({ message: "Bem-vindo à API!" }));
  } else if (url === "/users" && method === "GET") {
    const users = [
      { id: 1, name: "João" },
      { id: 2, name: "Maria" },
    ];
    res.statusCode = 200;
    res.end(JSON.stringify(users));
  } else if (url === "/users" && method === "POST") {
    let body = "";

    req.on("data", (chunk) => {
      console.log(body + "antes");
      body += chunk.toString();
      console.log(body);
    });

    req.on("end", () => {
      const newUser = JSON.parse(body);
      res.statusCode = 201;
      res.end(JSON.stringify({ message: "Usuário criado", user: newUser }));
    });
  } else {
    res.statusCode = 404;
    res.end(JSON.stringify({ message: "Rota não encontrada" }));
  }
};

// Criar o servidor HTTP
const server = http.createServer(requestHandler);

// Iniciar o servidor
server.listen(PORT, () => {
  console.log(`Servidor rodando em http://localhost:${PORT}`);
});
