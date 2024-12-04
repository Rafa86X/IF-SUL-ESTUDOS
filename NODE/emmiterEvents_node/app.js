const Pedido = require("./classeBase");
const readline = require("readline");

// Instância da classe Pedido
const pedido = new Pedido();

// Configuração do readline
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

// Listener para eventos de pedidos
pedido.on("novoPedido", (pedido) => {
  console.log(
    `🚚 Enviando pedido para entrega: ${pedido.quantidade}x ${pedido.item}`
  );
  console.log(`📋 Cliente: ${pedido.cliente}`);
  console.log(`📍 Endereço: ${pedido.endereco}`);
});

// Função para perguntar dinamicamente os dados do pedido
function perguntar(mensagem) {
  return new Promise((resolve) => {
    rl.question(mensagem, (resposta) => resolve(resposta.trim()));
  });
}

// Função para criar um novo pedido
async function criarPedido() {
  try {
    const item = await perguntar("Digite o item do pedido: ");

    if (!item) throw new Error("O item do pedido não pode estar vazio.");

    const quantidade = await perguntar("Digite a quantidade: ");

    if (!quantidade || isNaN(quantidade) || quantidade <= 0) {
      throw new Error(
        "A quantidade precisa ser um número válido e maior que 0."
      );
    }

    const cliente = await perguntar("Digite o nome do cliente: ");
    if (!cliente) throw new Error("O nome do cliente não pode estar vazio.");

    const endereco = await perguntar("Digite o endereço de entrega: ");
    if (!endereco) throw new Error("O endereço não pode estar vazio.");

    const novoPedido = {
      id: Math.floor(Math.random() * 1000),
      item,
      quantidade: parseInt(quantidade, 10),
      cliente,
      endereco,
    };

    pedido.criarPedido(novoPedido);
  } catch (err) {
    console.log(`⚠️ Erro: ${err.message}`);
  } finally {
    aguardarPedido(); // Continua o loop após processar o pedido
  }
}

// Função para iniciar o loop de criação de pedidos
function aguardarPedido() {
  console.log("\nAguardando um novo pedido...\n");
  criarPedido();
}

// Inicia o processo
aguardarPedido();
