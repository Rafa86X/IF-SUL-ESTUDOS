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
    `\n🚚 Enviando pedido para entrega: ${pedido.quantidade}x ${pedido.item}`
  );
  console.log(`📋 Cliente: ${pedido.cliente}`);
  console.log(`📍 Endereço: ${pedido.endereco}`);
});

// Função para perguntar dinamicamente os dados do pedido
async function perguntar(mensagem) {
  return new Promise((resolve) => {
    rl.question(mensagem, (resposta) => resolve(resposta.trim()));
  });
}

// Função principal
async function main() {
  let continuar = true;

  while (continuar) {
    console.log("\n--- Novo Pedido ---");

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
    }

    // Pergunta ao usuário se deseja continuar
    const resposta = await perguntar("\nDeseja criar outro pedido? (s/n): ");
    if (resposta.toLowerCase() !== "s") {
      continuar = false;
    }
  }

  // Fecha a interface readline
  rl.close();
  console.log("\n✅ Aplicação encerrada.");
}

// Executa a aplicação
main();
